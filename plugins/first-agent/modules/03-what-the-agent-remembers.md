# Module 3 — What the agent remembers

Goal: automatic memory is off, and they have a short set of standing rules that improves every future session.

Time: about 10 minutes.

Notes accumulated automatically against work that keeps changing lead to confident action on facts that are no longer true. The effect surfaces weeks later as the agent appearing to get worse for no visible reason.

---

## Teach: the three places instructions come from

Draw the distinction clearly, since they're about to change one of them.

**Rules you write.** A file called `CLAUDE.md`. You wrote it, you can read it, it loads every session, and it stays as written until you change it.

**Notes I write about you.** Separately, I take notes between sessions — what you seem to prefer, how your work is arranged — and read them back later. You didn't write them and likely won't review them.

**Rules that come with a project.** A `CLAUDE.md` inside a specific folder, describing that project. It applies when you're working there. You'll meet these later.

## Teach: the problem with automatic notes

Be concrete:

> The issue isn't that the notes are wrong when I write them. It's that your work moves and the notes don't. Three weeks later I read a note saying your report lives somewhere it no longer lives, and I trust the note instead of checking. You get a confident wrong answer with no visible cause.

Then the second issue, which is less obvious and equally consequential:

> They also occupy room. What I can hold in mind at once is finite. Notes from last month displace what you told me five minutes ago.

The recommendation: turn it off, and write the few genuinely durable things into rules yourself. Ten lines you control are worth more than a hundred you don't.

If they'd prefer to leave it on, note what to watch for and move on.

## Do: turn it off

Run `/memory` and use the auto memory toggle. That writes `"autoMemoryEnabled": false` into `~/.claude/settings.json`.

Show them the setting afterward. Seeing that a preference is a line in a file they own is the first appearance of an idea the rest of the setup depends on.

## Do: install their standing rules

Install `templates/global-rules.md` to `~/.claude/CLAUDE.md`.

Check whether that file already exists. If it does, show them what's there alongside what you'd add, and let them choose what to merge.

Expect a permission prompt on this write even in auto mode. Name it when it happens — it's the protected-path rule from module 2, and seeing it fire on a real edit demonstrates more than the explanation did.

Then explain what each rule gives them, one line each. Invite them to cut anything they disagree with — a rule they don't agree with will get worked around.

Tell them where it lives and that they can edit it at any time, in any text editor or by asking you.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 3
Next: 4
```

Next is the terminal and the tools that are missing from every new Mac. Note that it's the longest module, that it involves some waiting, and that it's where their password is required — entered by them. Ask whether they want to continue or take a break.
