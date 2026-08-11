---
description: Store, retrieve, list, or remove an API key, token, or password in the macOS Keychain so its value never enters a file or the conversation. Use when someone needs to save a credential, or when a task needs one that's already stored.
---

# Keychain

Credentials live in the macOS Keychain. Values never go into files, into the conversation, or onto a command line where they'd land in shell history.

Naming convention for stored items: `firstagent-<service>`, lowercase, e.g. `firstagent-openai`, `firstagent-hubspot`.

## Store

Never accept a credential pasted into the conversation. If someone pastes one, tell them it's now in the transcript, and that they should rotate it at the source before storing the replacement.

Run this and let the tool collect the value itself:

```bash
security add-generic-password -a "$USER" -s firstagent-<service> -w
```

With `-w` and no value, it prompts for the secret and reads it directly. Nothing is echoed and nothing reaches the conversation.

Hand the prompt to them. Confirm afterwards that the item exists, without reading its value.

To replace an existing item, add `-U`.

## Retrieve

Read a value into a variable and pass it onward in the same command. Keep it out of the transcript:

```bash
KEY=$(security find-generic-password -s firstagent-<service> -w) && <command using "$KEY">
```

Never run the bare `find-generic-password` on its own, which prints the value to the screen and into the transcript. If someone asks to see a key, tell them Keychain Access in Applications → Utilities will show it to them directly.

## List

```bash
security dump-keychain | grep -o 'firstagent-[a-z0-9-]*' | sort -u
```

Names only.

## Remove

```bash
security delete-generic-password -s firstagent-<service>
```

Confirm the exact item name with them first, then delete.

## When a service needs a file

Some tools require a credentials file on disk and can't read from the Keychain. When that happens:

- Put it outside any folder with git history, and outside Downloads and Desktop.
- Add its path to `permissions.deny` in `~/.claude/settings.json` so it can't be read by accident.
- Tell them where it is and why it's an exception.

$ARGUMENTS
