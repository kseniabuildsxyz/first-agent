# Module 3 — Instructions, memory, and context

Goal: they know the vocabulary, they understand what fills up a session and what carries between them, automatic memory is off, and they have a set of standing rules they've read.

Time: about 15 minutes.

---

## Open

Two lines: this covers what you remember, what you forget, and where the instructions you follow come from. One setting gets changed and one file gets installed, both in their home folder.

## Teach: the vocabulary

Define these before using them. They're about to make decisions that depend on the distinction.

- **A session** is one conversation. It has its own memory of what's been said, and it ends when they close it or clear it.
- **A project** is just a folder. Opening a session in a folder is what makes it that project's session — there's nothing to set up.
- **Context** is everything I can hold in mind at once in a session: what they've said, what I've read, every command and its output. It's finite.

## Teach: the five places my instructions come from

Draw this properly, because they're about to change one of them and the rest come up later.

| Source | Where | Who wrote it |
|---|---|---|
| Your standing rules | `~/.claude/CLAUDE.md` | You. Applies to every session on this machine |
| Project rules | `CLAUDE.md` in a folder | You or whoever owns that project. Applies when working there |
| Notes I take about you | Kept between sessions, read back later | Me, unprompted |
| Plugins | Installed bundles | Someone else. Adds instructions and tools |
| Your organisation's policy | Set centrally | Your admin. Can constrain everyone, and can't be overridden locally |

The first two they control and can read. The third they didn't write and probably won't review. The last one is worth knowing exists — if something is refused and no rule of theirs explains it, that's the likely reason.

## Teach: context, and why long sessions get worse

This is the mechanism behind most of what feels like an agent getting dumber, so give it room:

> Everything in our conversation stays in front of me, and there's a ceiling. Early on that helps — I've got your context. Past a point it works against you: a failed approach from an hour ago is still sitting there, competing with what you just asked for.
>
> When it fills up, the earliest things get squeezed out first. That includes instructions you gave me at the start.

Then the part about notes specifically:

> Notes I've written about you get read back into that same finite space. Notes from last month displace what you told me five minutes ago. And they don't age well — your work moves and the notes don't, so three weeks later I read that something lives where it no longer lives and I trust the note instead of checking.

## Do: turn automatic memory off

Recommend it rather than asking:

> I'd turn automatic note-taking off, and instead write the handful of genuinely durable things into rules you control. Ten lines you wrote beat a hundred you've never read. Say stop if you'd rather keep it on.

Run `/memory` and use the auto memory toggle, which writes `"autoMemoryEnabled": false` into `~/.claude/settings.json`.

Then show them the file. This is the first time they see it, so name what it is:

> That's `~/.claude/settings.json`. It's yours, it's plain text, and it holds your preferences for every session on this machine. Two of your choices are now four lines in a file you can open and read, rather than a setting buried in an app.

Nothing else about this write needs commentary.

## Do: install their standing rules

Separate step, separate ask. Don't bundle it with the memory question.

Install `templates/global-rules.md` to `~/.claude/CLAUDE.md`. Check first whether that file exists — if it does, show them what's there alongside what you'd add and let them choose what to merge.

Then walk what's in it, one line each, and say where it lives:

> These are at `~/.claude/CLAUDE.md`. They load at the start of every session on this machine, in any folder, and they stay exactly as written until you change them — in a text editor or by asking me.

**Invite them to cut things.** Not politeness: a rule they don't agree with is one they'll route around, and then they won't trust any of them.

## Teach: they can add a rule any time

This is the part people don't realise is available, so make it explicit:

> Anything you find yourself telling me twice is a candidate for that file. Say "save that as a standing rule" and I'll add it, and every future session starts with it. That's the difference between correcting me repeatedly and correcting me once.

Offer to add one now if something has already come up.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 3
Next: 4
```

Note that module 4 is the longest, that it involves waiting on downloads, and that it's where their password is needed — typed by them. Invite anything unclear from this module before moving on, and ask whether they want to continue or take a break.
