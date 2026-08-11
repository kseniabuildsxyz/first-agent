# Module 6 — Where keys live

Goal: they understand what a key is, their Keychain holds at least one, deny rules and the commit check are in place, and their machine has been swept for exposed credentials.

Time: about 15 minutes.

---

## Teach: what an API key is

> Most services will let a program act on your behalf — read your spreadsheet, send an email, look something up. To do that, the program needs to prove it's you. An API key is a long string of characters that does that proving. It's a password that a program uses instead of a person.

Then the part that makes it matter:

> A password usually has something else standing behind it — a code on your phone, a fingerprint. A key usually doesn't. Whoever holds it can do everything you can do, from anywhere, until you go and revoke it. That's the whole risk in one sentence.

## Teach: where keys go wrong

Three ways, all of which happen to careful people:

- **Saved as a file.** A downloaded credentials file sits in Downloads. Anything with access to that folder can read it, including an agent working nearby.
- **Pasted into a chat.** Once a key is in a conversation, it's in the transcript.
- **Committed.** A key inside a folder with history gets recorded permanently, and deleting the file later doesn't remove it from the history.

## Teach: the Keychain

> Your Mac has an encrypted store built into it, the same one Safari uses for your passwords. A program can be given permission to fetch a specific item, and the value stays out of everything else — out of your folders, out of our conversation, out of any file. That's where keys go.

## Do: store one

Use the `/first-agent:secrets` command, which wraps the underlying tool. Store something real if they have one, or a placeholder to demonstrate.

The mechanism, for the one sentence it deserves: the store prompts for the value directly, so the key never passes through the conversation or the command line.

Then show retrieval. Read it back and hand it to a command **without printing it** — the value going straight into a variable, never onto the screen. Point out what they didn't see.

Show them Keychain Access in Applications → Utilities so they know it's a real place with a normal window, not something abstract that lives inside the agent.

## Do: put the guardrails in

Two things, both quick.

**Deny rules.** Add the entries from `templates/deny-rules.json` to `~/.claude/settings.json` under `permissions.deny`. Explain what they buy:

> These tell me to refuse to read certain files at all — SSH keys, cloud credentials, anything named like a secret — even if you ask me to, and even in auto mode. If a stray credentials file is sitting somewhere, I won't open it.

State the limit honestly: this covers reading files directly and the common file commands. A program that opens files on its own isn't governed by it.

**The commit check.** The plugin ships a hook that runs gitleaks against staged changes before any commit, and blocks the commit if a key-shaped string is in it. It's already active from the module 4 install. Say what it does and when they'll notice it — which is rarely, and only when it matters.

## Do: sweep their machine

Run `/first-agent:scan-my-machine`.

Set expectations before the results: this finds credential-shaped files in the usual places, and finding something is the normal outcome rather than a sign of carelessness. Downloaded credential files are how nearly every integration starts.

Walk the findings with them one at a time. For each, the options are the same: move the value into the Keychain and delete the file, move the file somewhere deliberate, or leave it and note why.

Delete nothing without their explicit yes on that specific file.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 6
Next: 7
```

Next is short — the handful of habits that keep sessions working well, and what any of this costs. Ask whether they want to continue.
