# Module 6 — Version history

Goal: their work folder keeps a history, they've watched a restore put it back, and asking for a checkpoint before something big is a habit.

Time: about 10 minutes.

The point of this module is not version control as a discipline. It's that from here on, anything an agent does to their files is reversible — which is what makes it reasonable to let one work quickly.

They will not be typing `git add` and `git commit` by hand as a practice. You do that when they ask. So teach what the thing is for and what it protects them from, and spend the time on the one command whose effect they should see with their own eyes.

---

## Open

Two lines: this sets up a safety net for the folder, and they'll break something on purpose and get it back.

## Teach: what it's actually for

Lead with what they already know:

> git is version history for a whole folder, the way Google Docs keeps version history for a document. You can see what the folder contained at an earlier point and put it back to that state.
>
> One difference from Google Docs: it doesn't save versions automatically. Someone decides when a version gets saved. In practice that someone is me, when you ask — "save a checkpoint" and it's done.

Avoid comparing it to Cmd+Z. Cmd+Z is automatic, continuous, and per-document; this is deliberate, discrete, and per-folder. The comparison sets the wrong expectation.

Two words, one line each:

- **A repository** is a folder with version history turned on.
- **A commit** is one saved version, with a label saying what changed.

## Teach: the three things it buys them

This is the part worth their attention, because it's what version history is for in an operating role rather than in software.

**A way back.** Every saved version is a point they can return to. Before anything substantial, one command makes a point they can return to. That's the whole safety net.

**More than one person, without anyone getting overwritten.** Two people working on the same folder don't clobber each other — the histories get combined, and where the same line genuinely changed in both, it stops and asks rather than silently picking one. This is the thing that fails badly with shared files. Downloading a spreadsheet, editing it, and uploading it over the top destroys whatever anyone else did in the meantime, silently. Version history exists so that isn't the choice.

**A record of what changed and why.** Not just the current state but how it got here, with a label on each step. When something is wrong and nobody knows when it broke, that record is the answer.

Then the honest boundary:

> If you join a project someone else set up, it'll already have a structure and conventions — where things go, how changes get reviewed. Follow theirs. That's not something to relitigate on arrival, and I'll read what's there rather than imposing something.

## Do: turn on history

In their `agent` folder, initialise the repository, add a `.gitignore` for `.DS_Store`, and make the first commit.

The `.gitignore` is worth one sentence: `.DS_Store` is a hidden file Finder scatters into every folder, and it doesn't belong in version history.

If git doesn't know who they are, ask them for a name and email rather than assuming. Mention that these get stamped on every saved version and are publicly visible if a folder ever goes to GitHub — some people use a personal address for that reason.

Show them `git status` afterwards. It reports nothing to save, because everything is already in the version just made. That's the normal state and what they'll see most of the time.

## Do: break something and get it back

This is the part that makes it stick, so do it rather than describe it.

1. Ask permission first — their standing rules say ask before deleting a file, and this is that rule doing its job on your own suggestion.
2. Make a mess in `scratch/`: overwrite one existing file with garbage, delete another, and add a brand-new one.
3. Show them the damage with `git status --short`, and translate the codes: `M` modified, `D` deleted, `??` never seen before.
4. Say exactly what the restore will do before running it. Every file goes back to the last saved version; edits since then are gone; deleted files come back.

Then **have them run it themselves**, in their terminal:

```
git restore .
```

Have them run it rather than asking you to, and watch the folder change. Everything so far has arrived as conversation; this is one command with a visible, immediate effect on real files, and doing it themselves is what turns it from something you told them into something they've used.

Afterwards, show them the folder. The overwritten file has its old contents. The deleted file is back. And point out the limit that's visible on screen: the brand-new file is still there, because a version can only restore what was in it. New files get deleted by hand.

Then the takeaway:

> Anything done after a saved version can be thrown away. That costs you one command before you start something big.

Say plainly that this command is destructive in the other direction — it discards work that hasn't been saved, and nothing stops it. That's a reason to save a version first, not a reason to avoid it.

## Do: make it a habit

Add it to their standing rules, in **their** words, because a rule that sounds like them is one they'll use.

Ask how they'd phrase it — something like "commit before you change anything in my files" — then add it to `~/.claude/CLAUDE.md` and tell them where it went:

> That's in `~/.claude/CLAUDE.md` now, which every session on this machine reads at the start. You won't have to say it again.

If their phrasing is narrower than the folder git actually covers, say so once and leave their wording alone.

## Teach: what this doesn't cover

Two limits, so the net isn't trusted past its reach:

- **It covers this folder.** Files elsewhere on their computer aren't in it. Neither is anything already sent to another system — if an agent sends an email, git cannot unsend it. It protects the draft, not the send.
- **A version only exists if it was saved.** Everything above is true only because there was a version to go back to.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 6
Next: 7
```

Next: where passwords and keys live, and a sweep for any sitting somewhere they shouldn't. Ask whether they want to continue.
