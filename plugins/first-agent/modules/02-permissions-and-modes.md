# Module 2 — Permissions and the modes

Goal: they know which permission mode they're in, what each mode does, how to change it, and what auto mode's review is. Explained once, here.

Time: about 10 minutes.

This is the only module that explains the permission system. After it, do not narrate it again — an approval is the mode working, and saying so every time invites claims you haven't checked.

---

## Open

Two lines before starting: this module covers who approves what, and how to change that. Nothing gets installed and nothing on their machine changes.

## Do: find out which mode they're in

Establish this before teaching anything, and don't assume — the default has changed over time and differs by interface.

Check `/status`, or read `permissions.defaultMode` in `~/.claude/settings.json`. Say which mode is active and where you read it from.

Whatever you find, teach the whole set below. They need to recognise the others when they meet them.

## Teach: why anything asks permission

> Before I run a command or change a file, something has to decide whether that's allowed. The original answer was you — I show you the command, you approve it.
>
> The difficulty with that is what you're being shown is a line of code. If you can't read it, the decision isn't really yours; you're approving and hoping. It's a real check, and it's a weak one on its own.

That's the baseline. Everything else is a different answer to the same question.

## Teach: the modes

Six of them. What each allows without asking:

| Mode | Runs without asking | For |
|---|---|---|
| **Manual** | Reads only | Reviewing every change as it happens |
| **Accept edits** | Reads, file edits, and `mkdir` `touch` `mv` `cp` `rm` in the working folder | Watching the result rather than each step |
| **Plan** | Reads and exploring; no edits to your files | Getting the approach agreed before any work |
| **Auto** | Everything, with a separate review | Ordinary work |
| **Don't ask** | Only what's pre-approved; everything else is refused | Narrow, locked-down tasks |
| **Bypass permissions** | Everything, unreviewed | Throwaway machines. See below |

Manual is `default` in the settings file, which is worth mentioning once so the two names aren't confusing later. **Don't ask** exists only in the terminal version.

## Teach: what auto mode's review is

Say this once, properly, and then leave it alone for the rest of the walkthrough.

> In auto mode I'm not running unchecked. Reads and edits inside our folder go ahead on their own. Everything else — every command, anything touching a file outside our folder, anything touching my own configuration — goes to a **separate AI** that decides whether it fits what you actually asked for. If it doesn't, it doesn't run, and I don't get a vote.

Three properties worth having, all verifiable:

- **When it blocks, I'm told and I try something else.** If it blocks three times in a row, auto mode stops and hands the decision back to you.
- **When it can't be reached, nothing runs.** It fails closed. You may see me stop and say the reviewer is unavailable — that's the design, not a fault, and reads still work because they don't need review.
- **It reviews the action, not my intentions.** It sees the command I'm about to run.

That's the whole explanation. Do not return to it.

## Teach: what stating a limit does, and doesn't do

This is the part people get wrong in both directions, so be precise.

> If you tell me "don't delete anything without asking," that shapes what I'll attempt, and the reviewer is checking my actions against what you've asked for — so it has real effect. What it isn't is a lock. A sentence in our conversation doesn't change what the system permits; it changes what I try to do.
>
> If you want something that holds regardless of what I decide, that's a **deny rule** — a line in your settings that refuses an action outright, whatever either of us thinks. We set those up in module 6.

Two tools, different strengths. Say it plainly rather than overselling the first one.

## Teach: bypass permissions, and why not

They will encounter recommendations for this, so give them the real version.

> There's a mode with no review at all. In the terminal it's a flag with **dangerously** in the name; in this app it's **Bypass permissions** in the mode list, which you'd first switch on under Settings → Claude Code. Same thing.
>
> People recommend it because it's frictionless. It exists for machines you don't care about — a container, a throwaway VM. On your own computer it means nothing is checking anything: not you, not the reviewer. Anthropic's own documentation says it offers no protection against instructions hidden in something I read.

Then the useful part, which is that it's a toggle they could reach themselves:

> Nobody is going to turn this on without you. You'd have to enable it and select it. Knowing what it is is the point — so when someone online tells you to, you know what you'd be giving up.

## Do: switch modes themselves

Have them find the control. It's theirs to use, so they should have touched it once.

- **This app:** the mode selector next to the send button, in the Code tab.
- **Terminal:** `Shift+Tab` cycles through them; the active one shows at the bottom of the screen.

Have them look at the list, then return to the mode they started in. If they can't find it, ask them to describe what's next to the send button — the labels have changed between versions and theirs may differ from what's written here.

## Teach: the folder decides reach, not settings

Correct this now, because the natural assumption is wrong and it leads people to open a much broader folder than they need.

> The folder we're working in controls what I can **see**. It doesn't control where your settings apply. `~/.claude/settings.json` and `~/.claude/CLAUDE.md` are yours, machine-wide, whichever folder a session was started in.
>
> One exception in this app: the mode you pick in the selector is remembered for that folder. So the reach is per-folder, the mode is per-folder, and everything else you set is everywhere.

There's no reason to open a wide folder to make a setting stick. That's the takeaway.

## Do: watch it work

Have them ask for something harmless with several steps in it. The point is seeing it run start to finish without being interrupted.

- "Make me a folder of dated notes for this week in scratch"
- "Write some ASCII art to a file and then show it to me"
- "Create ten junk files in scratch and rename them all"

When it finishes, say what happened in one line and move on. Do not itemise which parts were reviewed.

## Do: give them the limit to try

Have them state one in their own words — "don't delete anything without asking me first" — and tell them what to expect: it will shape what you do, and module 6 turns the ones that matter into rules that hold on their own.

If they then ask for something that crosses it, stop and ask. Say you're stopping because they asked you to, not because something blocked you.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 2
Next: 3
```

Anything unclear here is worth raising now rather than later — invite it explicitly, and say that coming back to a question mid-walkthrough costs nothing and loses no progress.

Then: next is where instructions come from, what carries between sessions, and the one setting worth changing on day one. Ask whether they want to continue.
