#!/bin/bash
# Blocks a git commit when staged changes contain something that looks like a
# live credential. Runs gitleaks when available and falls back to a pattern
# check when it isn't.
#
# Passes through silently for every command that isn't a commit.

set -uo pipefail

input=$(cat)

command=$(printf '%s' "$input" | jq -r '.tool_input.command // empty' 2>/dev/null)
cwd=$(printf '%s' "$input" | jq -r '.cwd // empty' 2>/dev/null)

[ -z "$command" ] && exit 0

# Only act on git commit. Anything else is none of this hook's business.
printf '%s' "$command" | grep -qE '(^|[;&|[:space:]])git[[:space:]]+([^;&|]*[[:space:]])?commit([[:space:]]|$)' || exit 0

[ -n "$cwd" ] && cd "$cwd" 2>/dev/null
git rev-parse --git-dir >/dev/null 2>&1 || exit 0

deny() {
  jq -n --arg reason "$1" '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: $reason
    }
  }'
  exit 0
}

if command -v gitleaks >/dev/null 2>&1; then
  if ! output=$(gitleaks protect --staged --redact --no-banner 2>&1); then
    count=$(printf '%s' "$output" | grep -ci 'secret' || true)
    deny "gitleaks found what looks like a credential in the staged changes ($count finding(s)). The commit was blocked. Show the user which file it's in, help them move the value into the Keychain with /first-agent:secrets, then unstage the file and try again. Do not bypass this by disabling the check."
  fi
  exit 0
fi

# gitleaks unavailable: pattern check on staged content.
staged=$(git diff --cached --no-color 2>/dev/null | grep '^+' || true)
[ -z "$staged" ] && exit 0

patterns='sk-[A-Za-z0-9]{20,}|sk_live_[A-Za-z0-9]{20,}|pk_live_[A-Za-z0-9]{20,}|ghp_[A-Za-z0-9]{36}|gho_[A-Za-z0-9]{36}|github_pat_[A-Za-z0-9_]{50,}|xox[bpsa]-[A-Za-z0-9-]{10,}|AKIA[0-9A-Z]{16}|AIza[A-Za-z0-9_-]{35}|ya29\.[A-Za-z0-9_-]+|-----BEGIN [A-Z ]*PRIVATE KEY-----'

if printf '%s' "$staged" | grep -qE "$patterns"; then
  deny "The staged changes contain a string matching a known credential format. The commit was blocked. Find it, move the value into the Keychain with /first-agent:secrets, remove it from the file, then try again. Do not bypass this by disabling the check."
fi

exit 0
