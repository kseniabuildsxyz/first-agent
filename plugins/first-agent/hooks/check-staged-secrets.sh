#!/bin/bash
# Blocks a git commit when staged changes contain something that looks like a
# live credential. Runs gitleaks when it can be found and falls back to a
# pattern check when it can't.
#
# Passes through silently for every command that isn't a commit.
#
# Hooks do not run as a login shell, so ~/.zprofile is never read and Homebrew's
# bin directory is usually absent from PATH. Everything below is resolved by
# absolute path first and PATH second, so the check does not silently disable
# itself on a machine where it is installed and working.

set -uo pipefail

find_tool() {
  local name="$1" p
  for p in "/opt/homebrew/bin/$name" "/usr/local/bin/$name" "/usr/bin/$name"; do
    [ -x "$p" ] && { printf '%s' "$p"; return 0; }
  done
  command -v "$name" 2>/dev/null && return 0
  return 1
}

JQ=$(find_tool jq) || exit 0   # nothing can be parsed without it; fail open, quietly
GIT=$(find_tool git) || exit 0

input=$(cat)

command=$(printf '%s' "$input" | "$JQ" -r '.tool_input.command // empty' 2>/dev/null)
cwd=$(printf '%s' "$input" | "$JQ" -r '.cwd // empty' 2>/dev/null)

[ -z "$command" ] && exit 0

# Only act on git commit. Anything else is none of this hook's business.
printf '%s' "$command" | grep -qE '(^|[;&|[:space:]])git[[:space:]]+([^;&|]*[[:space:]])?commit([[:space:]]|$)' || exit 0

[ -n "$cwd" ] && cd "$cwd" 2>/dev/null
"$GIT" rev-parse --git-dir >/dev/null 2>&1 || exit 0

deny() {
  "$JQ" -n --arg reason "$1" '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: $reason
    }
  }'
  exit 0
}

GITLEAKS=$(find_tool gitleaks) || GITLEAKS=""

if [ -n "$GITLEAKS" ]; then
  if output=$("$GITLEAKS" protect --staged --redact --no-banner 2>&1); then
    exit 0
  fi

  # gitleaks exits non-zero for findings AND for its own errors. Only treat it
  # as a finding when it actually says so, otherwise fall through to patterns
  # rather than blocking the commit with a misleading reason.
  if printf '%s' "$output" | grep -qE 'leaks found: [0-9]+|WRN leaks found'; then
    count=$(printf '%s' "$output" | grep -oE 'leaks found: [0-9]+' | grep -oE '[0-9]+' | tail -1)
    [ -z "$count" ] && count="one or more"
    deny "gitleaks found what looks like a credential in the staged changes ($count finding(s)). The commit was blocked. Show the user which file it's in, help them move the value into the Keychain with /first-agent:secrets, then unstage the file and try again. Do not bypass this by disabling the check."
  fi
  # gitleaks failed for some other reason; the pattern check below still runs.
fi

# Pattern check on staged content: the fallback when gitleaks is missing or errored.
staged=$("$GIT" diff --cached --no-color 2>/dev/null | grep '^+' || true)
[ -z "$staged" ] && exit 0

patterns='sk-[A-Za-z0-9]{20,}|sk_live_[A-Za-z0-9]{20,}|pk_live_[A-Za-z0-9]{20,}|ghp_[A-Za-z0-9]{36}|gho_[A-Za-z0-9]{36}|github_pat_[A-Za-z0-9_]{50,}|xox[bpsa]-[A-Za-z0-9-]{10,}|AKIA[0-9A-Z]{16}|AIza[A-Za-z0-9_-]{35}|ya29\.[A-Za-z0-9_-]+|-----BEGIN [A-Z ]*PRIVATE KEY-----'

if printf '%s' "$staged" | grep -qE "$patterns"; then
  deny "The staged changes contain a string matching a known credential format (pattern check; gitleaks was $([ -n "$GITLEAKS" ] && echo "unavailable this run" || echo "not found on this machine")). The commit was blocked. Find it, move the value into the Keychain with /first-agent:secrets, remove it from the file, then try again. Do not bypass this by disabling the check."
fi

exit 0
