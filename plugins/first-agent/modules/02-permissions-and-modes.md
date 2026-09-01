# Module 2 — What runs, and who approves it

Goal: they understand that the agent runs real commands on their computer, that a second model reviews those actions, that they can find the mode control, and that when something comes back to them the decision is theirs.

Time: about 5 minutes.

This is the only module that explains permissions. After it, don't narrate the system again — an approval is it working, and saying so every time invites claims you haven't checked.

---

## Open

Two lines: this covers what actually happens when you ask me to do something. Nothing gets installed and nothing on their machine changes.

## Teach: I run real things on your computer

Start here, because everything else follows from it:

> When you ask me for something, I don't describe what would need to happen — I do it. I read files, write files, and run commands on this computer, the same commands you'd type yourself. That's the point, and it's also why there's something standing between me and your machine.

## Do: have them read the mode off the screen

**You can't see this reliably, so don't claim to.** `permissions.defaultMode` in `~/.claude/settings.json` is the mode new sessions *start* in. It isn't a record of what this session is on, and nothing on disk is. The screen is the only source.

- **In the desktop app**, it's a button at the bottom of the window, near where they type.
- **In a terminal**, the active mode shows at the bottom of the screen, and `Shift+Tab` cycles through the options.

Ask them to read out what it says. If they can't find it, ask them to describe what's at the bottom of the window — the labels shift between versions and theirs may not match anything written here.

Doing it this way is the truth, and it puts them in front of the control they'd use to change it. Finding that button is the only thing they need to take from this.

Auto mode is the usual answer. If they say something else, describe what they've actually got rather than what this module expects.

## Teach: auto mode

> Auto mode means I don't stop and ask before each step. Instead a **second model** — separate from me — looks at what I'm about to do and decides whether it matches what you actually asked for. Reads and edits inside our folder go ahead on their own. Commands, anything reaching outside this folder, anything touching my own settings: those go to the reviewer first.
>
> When it decides something doesn't fit, it doesn't run. I'm told, and I try another way. I don't get a vote.

Then the part they'll actually see, which is the point of the module:

> Sometimes it hands the decision to you instead. That's a prompt asking whether to allow something, and it's there because the reviewer thought it was worth your attention — not because I got stuck. When you see one, it's yours to answer.

Two properties, both true and both checkable:

- **When it can't be reached, nothing runs.** It fails closed. If I stop and say the reviewer is unavailable, that's the design, not a fault.
- **It reviews the action, not my intentions.** It sees the command I'm about to run.

That's the explanation. Don't return to it.

## Do: watch it work

Have them ask for something harmless with several steps in it — "make me a folder of dated notes for this week in scratch," "create ten junk files in scratch and rename them all." The point is seeing it run start to finish.

When it finishes, say what happened in one line. Don't itemise what was reviewed.

## Teach: telling me not to do something

> If you tell me "don't delete anything without asking," that shapes what I'll attempt, and the reviewer is checking my actions against what you asked for. It has real effect. What it isn't is a lock — a sentence in our conversation doesn't change what the system permits.
>
> If you want something that holds regardless of what either of us decides, that's a **deny rule**. We set those up in module 6.

## Teach: the one setting worth knowing by name

> There's a mode with no review at all. Here it's **Bypass permissions** in that same button's list, and you'd have to switch it on in Settings before it even appears. In a terminal it's a flag with **dangerously** in the name. Same thing.
>
> It exists for machines you don't care about — a container, a throwaway VM. On your own computer it means nothing is checking anything: not you, not the reviewer.
>
> Nobody can turn it on without you. Knowing what it is is the point — so when someone online tells you to, you know what you'd be giving up.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 2
Next: 3
```

Invite anything unclear now rather than later, and say that coming back to a question mid-walkthrough costs nothing and loses no progress.

Then: next is where instructions come from, what carries between sessions, and the one setting worth changing on day one. Ask whether they want to continue.
