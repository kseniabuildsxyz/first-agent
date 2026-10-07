# Module 2 — What runs, and who approves it

Goal: they understand that the agent runs real commands on their computer, that a second model reviews those actions, that they can find the mode control, and that when something comes back to them the decision is theirs.

Time: about 5 minutes.

Before starting, re-read START.md — in particular "How to read a module."

This is the only module that explains permissions. After it, don't narrate the system again.

---

## Open

> This module covers what actually happens when you ask me to do something, and who approves it. Nothing gets installed and nothing on your computer changes. It takes about five minutes.

## Teach: what an agent does on your computer, and why permission exists

Start here:

> When you ask me or any other agent to do something, we go and invoke tools on your computer. Agents can search, open, read and write files, and use other software on your machine. To do any of that, an agent needs your explicit permission to act on your behalf.
>
> There are a couple of ways agents have evolved to solicit that permission.
>
> 1. **An allowlist.** The agent compiles a list of the actions it's permitted to take — some of them specific to the folder it's working in, some applying generally. Any time an action comes up that isn't on that list yet, the agent has to stop and ask you. That ends up creating a really choppy experience, and it gets worse when the approval request is written as code you'd have to read in order to judge it. If you happen to not know how to read that code, approvals get granted on trust instead of on understanding, increasing the risk of approving risky things.
> 2. **Skipping permissions altogether.** You can tell an agent not to ask about anything, which lets it do very nearly whatever it likes on your computer. The setting is called `--dangerously-skip-permissions`. An agent running that way can delete files, move them, publish something publicly, or send something on your behalf, and you find out afterwards. Use at your own discretion.

## Do: have them read the mode off the screen

**You can't see this reliably, so don't claim to.** `permissions.defaultMode` in `~/.claude/settings.json` is the mode new sessions *start* in. It isn't a record of what this session is on, and nothing on disk is. The screen is the only source.

- **In the desktop app**, it's a button at the bottom of the window, near where they type.
- **In a terminal**, the active mode shows at the bottom of the screen, and `Shift+Tab` cycles through the options.

Ask them to read out what it says. If they can't find it, ask them to describe what's at the bottom of the window — the labels shift between versions and theirs may not match anything written here.

Doing it this way is the truth, and it puts them in front of the control they'd use to change it. Finding that button is the only thing they need to take from this.

Auto mode is the usual answer. If they say something else, describe what they've actually got rather than what this module expects.

## Teach: auto mode

> Auto mode is a recent addition to Claude where an agent like me doesn't ask you to approve every command. Instead a **second model** — separate from me — looks at what I'm about to do and decides whether it matches what you originally asked for. It examines the action itself, the command about to be run, rather than the agent's account of why it wants to run it. Reads and edits inside our folder don't need permission. Commands, anything reaching outside this folder, anything touching my own settings: those go to the reviewer first.
>
> If you tell me "don't delete anything without asking," that shapes what I'll attempt, and the reviewer checks my actions against what you asked for. When the reviewer decides that an action an agent is trying to perform doesn't fit the user's request, it doesn't allow the command to run and passes the approval on to the user. This results in a safer, smoother experience.
>
> The reviewer is a model as I am, which means it runs on a server, and servers occasionally go down. When that happens auto mode becomes unavailable, and any action of mine that would have needed the reviewer's approval cannot go ahead until the server is back. I'll tell you that's what's happening rather than leave you waiting. I can't approve my own actions in the reviewer's absence, or carry on as though it had approved them.
>
> If you want to create rules about what none of your agents should be able to do, regardless of what an agent or a reviewer decides, that's a **deny rule** - a deterministic way to reject specific commands on your computer. We set those up in module 6.

## Do: watch it work

Have them ask for something harmless with several steps in it — "make me a folder of dated notes for this week in scratch," "create ten junk files in scratch and rename them all." The point is seeing it run start to finish.

When it finishes, say what happened in one line. Don't itemise what was reviewed.

## Holding the objective

What they should be able to do afterwards: find the mode control, and recognise an approval prompt as the system working rather than as being blocked.

If they push further, these are true and worth having ready:

- **Can the reviewer be wrong?** Yes, in both directions. It's a model reading an action, not a proof. The deny rules in module 6 exist because judgement isn't a guarantee.
- **Does the reviewer read my files?** It sees the action about to be taken and the conversation that led to it, not an independent sweep of the disk.
- **Why not just approve everything myself?** You can, and for a while it's fine. It stops being fine quickly: even modest work throws dozens of approvals at you per request, and allowlists thin that out rather than end it. The problem isn't the time it costs, it's what the volume does to attention — past a certain point you stop reading the requests and start clicking through them, and the one you didn't read is the one that mattered. Auto mode exists so the things worth your attention are the ones that actually reach you.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 2
Next: 3
```

> If anything here is unclear, now is a good time to ask. Coming back to a question later also costs nothing (besides a few tokens, ha!) and loses no progress. Next is where my instructions come from, what carries over between sessions, and the one setting worth changing on day one. It takes about fifteen minutes. Would you like to keep going?
