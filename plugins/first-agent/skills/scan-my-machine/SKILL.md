---
description: Scan the usual places on a Mac for exposed API keys, credential files, and tokens, then walk each finding with the user. Use when someone asks whether they have credentials sitting somewhere unsafe, or during onboarding module 6.
---

# Scan for exposed credentials

Find credential-shaped files sitting where they shouldn't be, report them, and help move them somewhere deliberate.

Finding something is the expected outcome. Downloaded credential files are how most integrations begin. Report findings as facts, without commentary on how they got there.

## Scope

Search these:

- `~/Downloads`, `~/Desktop`, `~/Documents`
- `~/agent` and any git repositories under the home directory
- The home directory itself, top level only

Skip `~/Library`, `~/.ssh`, `~/.aws`, `~/.config`, and application support directories. Credentials there are in their correct location. Skip `node_modules`, `venv`, `.venv`, and `site-packages`.

## What to look for

**By filename:**

```
*client_secret*.json   *credentials*.json   *service_account*.json
*token*.json           .env  .env.*          *.pem  *.key  *id_rsa*
*backup_code*          *recovery*code*       *api*key*
```

**By content**, in text files under 1 MB — provider key prefixes and assignments that look like a live secret:

```
sk-  sk_live_  pk_live_  ghp_  gho_  github_pat_  xoxb-  xoxp-  AKIA
AIza  ya29.  -----BEGIN (RSA|OPENSSH|EC|PRIVATE) KEY-----
(api[_-]?key|secret|token|password)\s*[=:]\s*['"][^'"]{16,}
```

**Higher priority when found:**

- Anything inside a folder with git history, since history retains it after deletion
- Anything in `~/Desktop` or `~/Downloads`, which agents and sync tools reach routinely
- Anything already committed — check with `git log --all -- <path>`

## Reporting

Never print a secret's value. Report the file, what kind of credential it appears to hold, and why its location matters. A prefix and length is enough to identify one.

Present findings as a short table, highest priority first. If there are more than about eight, group them and start with the ones in git history.

Say what was searched and what was skipped, so the result isn't read as a clean bill of health for the whole machine.

## Resolving each finding

One at a time, with the same three options:

1. **Move the value into the Keychain** and delete the file — `/first-agent:secrets` handles the store.
2. **Move the file** somewhere deliberate, outside git history and outside Downloads and Desktop, and add a deny rule for its path.
3. **Leave it** and record why.

Delete nothing without an explicit yes on that specific file.

When something is already in git history, say plainly that removing the file now doesn't remove it from history, and that the reliable fix is to revoke and reissue the credential at the service that issued it. Offer to help find where to do that.

## Finish

Summarize what moved and what's still outstanding. Offer to add deny rules for any locations that turned out to hold credentials legitimately.

$ARGUMENTS
