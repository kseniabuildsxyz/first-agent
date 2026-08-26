# Module 7 — Keys and secrets

Goal: they understand what a key is, their Keychain holds one, deny rules and the commit check are in place, they know what's in a transcript, and their machine has been swept.

Time: about 15 minutes.

---

## Open

Two lines: this is about where passwords and keys belong, plus a sweep of their machine for any sitting somewhere they shouldn't. Two settings get added and nothing gets deleted without their say.

## Teach: what an API key is

> Most services will let a program act on your behalf — read a spreadsheet, pull an invoice, look something up. To do that, the program has to prove it's you. An API key is a long string of characters that does the proving. It's a password that a program uses instead of a person.

Then the part that makes it matter:

> A password usually has something standing behind it — a code on your phone, a fingerprint. A key usually doesn't. Whoever holds it can do everything you can do, from anywhere, until you go and revoke it.

## Teach: the three ways keys get loose

- **Saved as a file.** An integration hands you a credentials file and it lands in Downloads. Anything with access to that folder can read it, including an agent working nearby.
- **Pasted into a conversation.** Covered below — it's the one that needs explaining rather than asserting.
- **Committed.** A key inside a folder with version history gets recorded in that history. Deleting the file afterwards does not remove it; the old version still has it. That's the one with no clean fix.

## Teach: why a key in a transcript is a problem

The obvious objection is that the transcript is a local file on their own machine, and that objection is reasonable. Answer it:

> Every session is written to a file on your computer — `~/.claude/projects/<folder>/<session-id>.jsonl`. So a key you paste here isn't broadcast anywhere. The problem is what happens to that file afterwards.
>
> Transcripts get moved. They get copied to a new laptop, handed to a colleague to show them something, pasted into another session for debugging, attached to a bug report. Each of those is reasonable and none of them involves thinking about a key you pasted three weeks ago. The file also outlives your memory of what's in it — it's a megabyte of JSON, and nobody re-reads one.
>
> So the rule isn't "the transcript is dangerous." It's that a key stops being under your control the moment it's written down somewhere you won't check again.

## Teach: where keys should live

> Your Mac has an encrypted store built in — the Keychain, the same one Safari uses for your passwords. A program can be given permission to fetch one specific item, and the value stays out of everything else: out of your folders, out of our conversation, out of any file.

## Do: store one

Use `/first-agent:secrets` if the plugin installed; otherwise run the underlying command. Store something real if they have one, or a throwaway to demonstrate.

**They type the value**, and say why in one line: the tool prompts for it directly, so it never passes through this conversation or the command line where it would land in shell history.

Then confirm the item exists **without reading it**. Confirm existence only — don't report its length, its first character, or anything else about the value. There's no version of describing a secret that belongs in a transcript, and the demonstration is that nothing came back, not that a little came back.

Then show them retrieval: read the value into a variable and hand it straight to a command that needs it, with nothing printed. Point out what they didn't see.

Show them where it lives so it isn't abstract. **Search for the Keychain Access app by name** — Spotlight with **Cmd+Space**, type `keychain`. Open it and search for the item there. Don't send them to Applications → Utilities to find it; searching by name is what works.

## Do: put the guardrails in

Two things. Recommend both rather than asking.

**Deny rules.** Add the entries from `templates/deny-rules.json` to `~/.claude/settings.json` under `permissions.deny`:

> I'd add these. They mean I refuse to read certain files at all — SSH keys, cloud credentials, anything named like a secret — even if you ask me to directly. If a stray credentials file is sitting in Downloads, I won't open it. Say stop if you'd rather not.

State the limit honestly: this covers reading files directly and the common file commands. A program that opens files on its own isn't governed by it. It closes the accident, not every path.

This is also the other half of module 2. A sentence in conversation shapes what you attempt; one of these refuses the action outright, whatever either of you thinks. Say that once — it's the payoff for the distinction drawn earlier.

**The commit check.** The plugin ships a hook that runs gitleaks against staged changes before any commit and blocks it if something key-shaped is in there.

**Check whether it's actually active** rather than assuming the module 5 install worked. If the plugin didn't install, wire it up by hand:

1. Copy `hooks/check-staged-secrets.sh` to `~/.claude/hooks/`.
2. Add a `hooks` entry to `~/.claude/settings.json` pointing at it.

It needs `gitleaks` and `jq`, both installed in module 5. Say what it does and when they'll notice it, which is rarely and only when it matters.

Then state its reach honestly, because the obvious assumption is wider than the truth:

> This catches commits I make. If you commit in your own terminal, it isn't in the way — the check lives in my settings, not in the folder. That's worth knowing rather than discovering.

## Do: sweep their machine

Run `/first-agent:scan-my-machine`, or the equivalent by hand.

**Ask for the reach first.** The sweep needs to look in Downloads, Desktop, and Documents, and those are outside the folder this session was opened in. Say so and say why:

> To do this properly I need to look outside our folder — Downloads, Desktop, Documents, and the top level of your home folder. That's where credential files end up. I'll list what I searched afterwards, I won't open anything that isn't credential-shaped, and you can tell me to skip any of it.

macOS may also prompt for Desktop, Documents, or Downloads access at this point. That's the operating system asking, not this walkthrough.

Set expectations before the results: finding something is the normal outcome, not a sign of carelessness. Downloaded credential files are how nearly every integration starts.

Walk the findings one at a time. For each, the options are the same: move the value into the Keychain and delete the file, move the file somewhere deliberate, or leave it and note why.

**Delete nothing without an explicit yes on that specific file.**

Where something is already in version history, say plainly that removing the file now doesn't remove it from history, and that the reliable fix is to revoke and reissue the credential at the service that issued it. Offer to find where.

Say what you searched **and what you skipped** — `~/Library`, `~/.ssh`, `~/.aws`, `~/.config`, `~/.gnupg` — so a clean result isn't read as a clean bill of health for the whole machine.

## Do: check a transcript before it travels

Short, and it closes the loop on the earlier teaching.

Offer to scan this session's own transcript and tell them what's in it. Report the categories honestly: their email address, machine paths, account identifiers, the titles of any documents that came up. Note that pattern-matching for keys throws false positives — the strings that search *for* keys look like keys — so a hit isn't a leak.

Then the practical answer:

> Moving one to another machine of your own is fine. Sending one to someone else is worth a look first — not usually for keys, but for the names of things. Document titles and folder names tell an outsider what you're working on. Ask me to check before one leaves.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 7
Next: 8
```

Next is short and is entirely about habits — the difference between an agent that stays useful and one that seems to get worse over a week. Ask whether they want to continue.
