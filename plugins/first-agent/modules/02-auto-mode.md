# Module 2 — Removing the approval treadmill

Goal: auto mode is on, and they understand what's protecting them well enough to rely on it.

Time: about 10 minutes.

Approval prompts are the most common reason people stop using agent tools. Resolving this early is what makes the rest of the setup workable.

---

## Teach: what the prompts are, and their limits

Ask whether they've noticed you stopping to ask permission. Then describe the actual problem:

> Every time I want to run a command, I ask you first. The difficulty is that what I'm showing you is a line of code. If you can't read it, the decision isn't really yours — you're approving and hoping.

State it directly.

## Teach: what auto mode is

Frame it accurately: a reviewer is added, not a check removed.

> There's a mode where I stop asking about routine work. It isn't me running unchecked. A **separate AI** reviews every command I'm about to run, independently, and decides whether it fits what you actually asked for. If it doesn't, it's blocked before it runs — and I don't get a vote.

What it blocks, in terms they'll recognize:

- Downloading something from the internet and running it
- Sending your data somewhere outside your computer
- Destroying files that existed before we started talking
- Anything that would expose a password or key
- Wiping your home folder

What it allows, so they understand the mode is doing real work:

- Creating and editing files in the folder we're working in
- Reading things
- Installing the tools a project says it needs

## Teach: the two facts that make it reliable

Both are accurate and neither is widely known. They're what makes the mode reasonable to depend on.

**Some things are always confirmed with you, in every mode.** Your shell settings, this agent's own configuration, and a project's internal machinery. You'll see me stop and ask when we touch one of those — that's the protection working.

**Limits you state in plain English are enforced.** If you tell me "don't send anything to anyone until I've read it," that becomes a real block, applied by the independent reviewer rather than depending on my memory. It stays in force until you lift it, and my own judgment that I've satisfied it doesn't lift it.

Offer the second as something to try.

## Teach: the limits of it

Cover three:

- It reduces risk substantially. For anything expensive to reverse, ask me to show you the plan first.
- It has a cost — every command gets a second opinion, which takes a moment and uses some of your quota.
- If it blocks me three times in a row, it returns to asking you. That's intended behavior.

And one item they may encounter elsewhere:

> You'll see people online recommend a flag with "dangerously" in its name. That one removes the reviewer entirely. It exists for disposable machines. If you ever see me start a session that way, stop me.

## Do: turn it on

Auto mode requires Opus 4.6 or later, Sonnet 4.6 or later, or Fable 5. Check with `/status` and switch with `/model` if needed. On an older model, use `acceptEdits` instead and explain that auto mode becomes available on a supported model. Say which mode ends up active.

Have them do this themselves:

> Hold Shift and press Tab a few times. You'll see the mode change at the bottom of the screen. Stop when it reads auto mode on.

Then offer to make it the default so this isn't repeated every session — `"permissions": { "defaultMode": "auto" }` in `~/.claude/settings.json`. Ask before writing it. Mention that it has to be the file in their home folder, since a project can't grant itself auto mode.

## Do: demonstrate it

Have them ask you for something harmless that takes several commands — ASCII art in a file, a folder of dated notes, renaming a batch of files in `scratch/`. Anything multi-step.

The point is watching it run start to finish without intervening. Note that when it finishes.

Then have them set a limit — "don't delete anything without asking" — and confirm it's in force.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 2
Next: 3
```

Next: what you retain between sessions, and the one setting worth changing on day one. Ask whether they want to continue.
