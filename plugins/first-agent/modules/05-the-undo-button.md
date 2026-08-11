# Module 5 — The undo button

Goal: their work folder keeps a history, they've saved a checkpoint and restored from it, and committing before a big change is a habit.

Time: about 10 minutes.

The value here isn't version control as a discipline. It's that from this point on, any change an agent makes is reversible, which is what makes it reasonable to let one work quickly.

---

## Teach: git as version history

Skip branches and remotes entirely. Lead with something they've already used:

> git is version history for a whole folder, the way Google Docs keeps version history for a document. You can see what the folder contained at an earlier point, and put it back to that state.
>
> One difference from Google Docs: it doesn't record versions automatically. You decide when a version gets saved. That's the whole of it — before I do something substantial, you save a version, and if the result is wrong you go back to it.

Avoid comparing this to Cmd+Z. Cmd+Z is automatic, continuous, and per-document; this is deliberate, discrete, and per-folder. The comparison sets up the wrong expectation and then the commands don't fit it.

Two terms, one line each:

- **A repository** is a folder with version history turned on.
- **A commit** is one saved version, with a label saying what changed.

## Teach: why saving a version takes two commands

This is where people get stuck, so give it its own moment rather than glossing it.

> git can see everything in the folder that changed. It doesn't assume all of it belongs together. So saving a version is two steps: first you say which changes go in this version, then you save it.
>
> `git add -A` is the first step. The `-A` means "all of them," which is what you want almost every time.
>
> `git commit -m "..."` is the second. It saves the version and attaches the label you write.

Then the reason the separation exists, because without it the first step looks like pointless ceremony:

> Say you fixed a typo and also rewrote a whole section. Those are two different pieces of work. Recorded as one version, you can't undo the rewrite later without also undoing the typo fix. Recorded separately, each one is independently reversible.
>
> You won't need that for a while. Until you do, `-A` every time is the right answer.

One piece of vocabulary they'll meet whether or not you teach it: changes picked for the next version are called **staged**. It shows up in `git status` output, so name it once so it isn't a mystery later.

## Do: turn on history

In their `agent` folder:

```
git init
git add -A
git commit -m "Starting point"
```

Map each line onto what they just heard, one at a time rather than as a block:

| Command | What it does |
|---|---|
| `git init` | Turns on version history for this folder |
| `git add -A` | Everything currently in the folder goes in this version |
| `git commit -m "Starting point"` | Saves it, labelled "Starting point" |

`git init` is once per folder, ever. The other two are the pair they'll run again each time they save a version.

Then have them run `git status`. It reports nothing to save, because everything is already in the version they just made. Point out that this is the normal state and what they'll see most of the time.

If git asks who they are, set it with their name and email — `git config --global user.name` and `user.email`. Ask them for both rather than guessing.

## Do: break something and get it back

This is the part that makes the concept stick, so do it rather than describe it.

1. Have them ask you to make a mess in `scratch/` — overwrite an existing file, delete another, and add a new one.
2. Show them the damage. `git status` lists what changed.
3. Before restoring, say what's about to happen: every file goes back to how it stood in the last saved version. Edits made since then are gone, and files deleted since then come back.
4. Restore it: `git restore .`
5. Show them the folder. The overwritten file has its old contents, and the deleted file has returned.

One limit to point out while it's visible on screen: the brand-new file is still there. A version can only restore what was in it, and that file has never been in one. New files are deleted by hand.

Then say the thing they should take away:

> That's the safety net. Anything I do after a saved version can be thrown away. It costs you one command before you start something big.

Note that in auto mode the reviewer treats discarding uncommitted work as a blocked action, so a restore like that one is something you'll confirm with them rather than do on your own initiative.

## Do: make it a habit

Add it to their standing rules if it isn't there in spirit already, and say it plainly:

> Before you ask me for anything substantial, say "save a checkpoint first." I'll commit, then start. It takes two seconds and it means you never have to hope.

Have them do it once, in their own words, so the phrasing is theirs.

## Teach: what this doesn't cover

Two limits, stated so the net isn't trusted beyond its reach:

- It covers this folder. Files elsewhere on their computer, and anything already sent to another system, aren't in it.
- A version only exists if it was saved. The habit above is what makes everything else in this module true.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 5
Next: 6
```

Next: where passwords and keys live, and a sweep of their machine for any sitting somewhere they shouldn't. Ask whether they want to continue.
