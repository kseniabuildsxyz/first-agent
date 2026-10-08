# Module 6 — Keys and secrets

Goal: they understand what a key is, their Keychain holds one, deny rules and the commit check are in place, they know what's in a transcript, and their machine has been swept.

Time: about 20 minutes.

Before starting, re-read START.md — in particular "How to read a module."

---

## Open

> This module is about where passwords and keys belong. We'll store one properly, add two safeguards, and then look through your computer for any keys sitting somewhere they shouldn't be. The last part may turn up files worth deleting, and I'll ask you about each one before anything goes. It takes about twenty minutes.

## Teach: what an API key is

> Most online services will let a program act on your behalf: read a spreadsheet, pull an invoice, look something up. To do that, the program has to prove it's acting for you, and an **API key** is how it proves it. An API key is practically a password, just one written for a program to use rather than a person.
>
> Your own passwords usually have a second check attached, like a code sent to your phone or a fingerprint. A key usually has nothing behind it, so whoever holds it can do everything it allows, from anywhere, until you go to the service and cancel it or the key refreshes.

## Teach: the three ways keys get loose

> Keys usually end up somewhere unsafe in one of three ways.
>
> The first is being saved as a file. A service hands you a credentials file when you set up an integration, and it lands in your Downloads folder. Anything with access to that folder can read it, including an agent working nearby.
>
> That matters because of what happens next rather than because an agent is untrustworthy. An agent that can read a key can also copy it somewhere worse without meaning to: into a file it writes, into a command that gets saved in your terminal's history, into a saved restore point, or into our conversation, which is itself saved to a file. One careless step and a key that was in one place is now in four, and you'd have to remember all four to clean it up.
>
> The second is being pasted into a conversation like this one. That one needs a longer explanation, so I'll come back to it in a moment.
>
> The third is being saved into version history. If a key is inside a folder with version history turned on and a restore point gets saved, the key is recorded in that history. Deleting the file afterwards doesn't remove it, because the earlier restore point still contains it. That's the hardest of the three to undo, and the reliable fix is to cancel the key at the service and get a new one.

## Teach: why a key in a transcript is a problem

The obvious objection is that the transcript is a local file on their own machine, and that objection is reasonable. Answer it:

> Every session is saved to a file on your computer, in a hidden folder at `~/.claude/projects/`. So a key you paste here isn't broadcast anywhere. The problem is what happens to that file later.
>
> Transcripts get moved. They get copied to a new laptop, shared with a colleague to show them something, pasted into another session to debug a problem, or attached to a bug report. Each of those is a reasonable thing to do, and none of them involves remembering a key you pasted three weeks earlier. The file also outlasts your memory of what's in it: it's a large file of structured text, and it isn't something you'd ever sit down and re-read.
>
> So a key in a transcript is a key written down somewhere you won't check again, and once that's true, it's no longer under your control.

## Teach: where keys should live

> Your Mac has an encrypted store for secrets built in, called the **Keychain**. It's the same one Safari uses for your saved passwords. A program can be given permission to fetch one specific item from it, and the value stays out of everything else: out of your folders, out of our conversation, and out of any file.

## Do: store one

Use `/first-agent:secrets` if the plugin installed; otherwise run the underlying command. Store something real if they have one, or a throwaway to demonstrate.

**They type the value.** Hand them the store command to run in their terminal, and say why:

> You'll type the value yourself, into a prompt the Keychain tool opens in your terminal. That way it goes straight into the Keychain and never passes through this conversation, or through the command itself, where it would be saved in your terminal's history.

Then confirm the item exists **without reading it**. Confirm existence only — don't report its length, its first character, or anything else about the value. A length doesn't prove the value is correct, and it leaks a little.

The proof that the right thing went in is the retrieval step below: fetch it by name, use it against the real service, and let the service's answer be the evidence. Say that's what you're doing, so "I can't show you the value" doesn't read as "I can't tell whether this worked."

Then show them retrieval: read the value into a variable and hand it straight to a command that needs it, with nothing printed. Then point out what they didn't see:

> That worked, which is the proof the right value went in: the service accepted it. And the key never appeared on screen or in our conversation. That's how a key should be used from now on, fetched by name and handed straight to the command that needs it.

Show them where it lives so it isn't abstract. **Search for the Keychain Access app by name** — Spotlight with **Cmd+Space**, type `keychain`. Open it and search for the item there. Don't send them to Applications → Utilities to find it; searching by name is what works.

## Do: put the guardrails in

Two safeguards. Recommend both rather than asking. You write both into `~/.claude/settings.json`; they don't edit it.

**Deny rules.** Add the entries from `templates/deny-rules.json` to `~/.claude/settings.json` under `permissions.deny`, merging into any list already there and skipping entries it already has:

> In module 2 I mentioned **deny rules**, which are a deterministic way to block specific actions on your computer, regardless of what I or the reviewer decide. I am going to add a set of deny rules now. They stop me from reading certain files at all: SSH keys, cloud credentials, and anything named like a secret. That holds even if you ask me to read one directly, so if a stray credentials file is sitting in your Downloads, I can't open it. Say stop if you'd rather not set this up.
>
> This is the difference between telling an agent something and setting a rule. Telling me "don't read my credentials" shapes what I attempt, and the reviewer checks my actions against it, but it's a judgement being made each time. A deny rule refuses the command outright, in deterministic code, with no judgement involved.
>
> They do have a limit. They cover an agent reading those files directly and through the common file commands, but a separate program that opens files on its own isn't governed by them.

**The commit check.** The plugin ships a hook that runs gitleaks against staged changes before any commit and blocks it if something key-shaped is in there.

> The second safeguard is a check on version history. Before an agent saves any change into version history, it runs gitleaks over what's about to be saved and stops the save if anything looks like a key. You'll rarely notice it, and when you do, it will be because it caught something.
>
> It has a limit too. It checks saves that agents make. If you save to version history yourself, from your own terminal, it doesn't run, because the check lives in the agent's settings rather than in the folder.

**Check whether it's actually active** rather than assuming the module 5 install worked. If the plugin didn't install, wire it up by hand — you do this, not them. Check `~/.claude/settings.json` for an existing entry first, so the check isn't wired twice:

1. Copy `hooks/check-staged-secrets.sh` to `~/.claude/hooks/`.
2. Add a `hooks` entry to `~/.claude/settings.json` pointing at it, alongside any hooks already there.

It needs `gitleaks` and `jq`, both installed in module 5.

## Do: sweep their machine

Run `/first-agent:scan-my-machine`, or the equivalent by hand.

**Ask for the reach first.** The sweep needs to look in Downloads, Desktop, and Documents, and those are outside the folder this session was opened in:

> I'm about to scan your computer for files that look like they hold keys or credentials.
>
> To do this properly I need to look outside our folder: in Downloads, Desktop, Documents, and the top level of your home folder, because that's where credential files usually end up. I'll list everything I searched afterwards, I won't open anything that doesn't look like a credential, and you can tell me to skip any of those places.
>
> You may see macOS pop-ups while I do this, asking whether to let Claude open your Desktop, Documents or Downloads. That's the second layer from module 1: macOS asking on its own behalf, not me asking again.

Set expectations before the results:

> One thing before the results: finding something here is not unusual. Plenty of services ask you to download a key or a backup file when you set them up, and those files tend to stay wherever they landed. If that's what we find, we can move them somewhere safe now.

Walk the findings one at a time. For each, the options are the same: move the value into the Keychain and delete the file, move the file somewhere deliberate, or leave it and note why.

**Delete nothing without an explicit yes on that specific file.**

Where something is already in version history, say plainly that removing the file now doesn't remove it from history, and that the reliable fix is to cancel and reissue the credential at the service that issued it. Offer to find where.

Say what you searched **and what you skipped** — `~/Library`, `~/.ssh`, `~/.aws`, `~/.config`, `~/.gnupg` — so a clean result isn't read as a clean bill of health for the whole machine.

## Do: check a transcript before it travels

Short, and it closes the loop on the earlier teaching.

Offer to scan this session's own transcript and tell them what's in it. Report the categories honestly: their email address, machine paths, account identifiers, the titles of any documents that came up. Pattern-matching for keys throws false positives — the strings that search *for* keys look like keys — so a hit isn't a leak.

Then the practical answer:

> Moving a transcript to another computer of your own is fine. Sending one to someone else deserves a check first, and usually not because of keys. It's because of the names of things: document titles and folder names tell someone outside your work what you're working on. If you ever want to send one, ask me to check it first.

## Holding the objective

What they should be able to do afterwards: say where a key should live and why pasting one into a conversation is a problem, and know that a deny rule and the commit check are in place and what each one doesn't cover.

If they push further, these are true and worth having ready:

- **"I've pasted a key into a chat before. What should I do?"** Cancel it at the service that issued it, create a new one, and store the new one in the Keychain. Deleting the message doesn't remove it from the transcript file.
- **"Can you read my Keychain?"** Only an item a command asks for by name, and the pattern here fetches it straight into that command without printing it. An agent can't browse it.
- **"Does the sweep send anything anywhere?"** No. It runs on this machine and reports here.
- **"What if a service insists on a credentials file?"** Keep it outside any folder with version history and outside Downloads and Desktop, add its path to the deny rules — you do that — and note it as an exception.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 6
Next: 7
```

> The next module is about working habits: the difference between an agent that stays useful and one that seems to get worse over time. It takes about fifteen minutes. Would you like to keep going?
