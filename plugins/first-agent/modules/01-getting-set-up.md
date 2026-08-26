# Module 1 — Getting set up, and what I can reach

Goal: they're in the right place with the right folder, they understand the boundary around you, and you have a profile of them to work from.

Time: about 10 minutes.

---

## Open

Two lines: this module is about where you're working and what you can reach, plus a few questions about their work so the rest fits them. Nothing gets installed.

## Do: establish which interface they're in

Ask, because it changes the instructions for the whole walkthrough:

> Are you in the Claude desktop app, or in a terminal window?

**Desktop app** — the likely answer, and the one everything here assumes. Confirm they're in the **Code** tab, not Chat.

**Terminal** — check that `claude` is actually installed before going further. If it isn't, that's the first problem to solve, and it's a real detour rather than a footnote. Offer either to walk them through installing the CLI, or to move to the desktop app, which needs nothing installed.

Record the answer. Everywhere below that names a button, adapt it.

## Do: confirm the folder

Check where you are with `pwd`. You should be in an empty folder called `agent` on their Desktop.

If they're somewhere else — their home folder, Documents, an existing project — say so plainly and fix it before continuing. The rest of this module isn't true from a folder full of their things:

> I'm currently pointed at your whole home folder, which means Documents, Downloads and everything else is in reach. That's more than this needs. Make an empty folder called `agent` on your Desktop and restart me there — in the Code tab, click the folder name at the top and choose it.

## Teach: the boundary

Now that it's true, say it:

> I can see this folder and everything inside it. Right now that's nothing — it's empty. I can't see your Documents, your Downloads, your Photos, your email, or anything else on your computer.

Give it a moment. It's the first thing worth knowing, and starting in an empty folder is what makes it a fact rather than a reassurance.

Then the other half, which comes up the first time they want to work on something real:

> The flip side is that if you ask me to work on a file that lives elsewhere, I'll tell you I can't reach it. Then you either move a copy here, or you point me at that folder deliberately. Widening what I can see is a decision you make, not something that happens quietly.

## Teach: the prompts from macOS

They will already have seen at least one of these, so account for them rather than letting them sit as unexplained alarm:

> A few of those pop-ups come from macOS, not from me. Desktop, Documents and Downloads are folders macOS protects, so the first time anything reaches into one it asks you. You may also get asked about Photos, Music, or Google Drive — nothing here needs those, so decline them if you'd rather.
>
> All of it is adjustable later in System Settings → Privacy & Security. And they can reappear after an app update, which is a known annoyance rather than a sign something changed.

## Do: set up the folder

Create two folders inside `agent`:

```
projects/    things you're building
scratch/     experiments and throwaways
```

One sentence on why: everything agent-related lives in one place, so they always know where to start a session and what each folder is for.

Then flag what's coming:

> One thing for later — passwords and keys go somewhere dedicated and secure, which we set up in module 7. Don't paste any into this chat before then.

## Do: learn what they work on

Interview them conversationally — ask, listen, follow up. Cover:

- What they do, and what a normal week looks like
- **Where they do it** — which apps and tools they're in every day, and where their work actually lives
- One thing they do repeatedly that they'd rather not
- Anything on their computer or in their accounts you should leave alone

The last question matters most. Ask it directly and keep the answer in their own words. If they say "nothing, this machine is new," take that as given — and note that accounts aren't new even when a machine is, which module 9 will come back to.

**Don't write this to a file yet.** Hold it in the conversation. In module 3 they get a standing-rules file that every future session reads, and this is what goes at the top of it — written in their words, by them, in a file they own. A profile stashed in a folder nothing reads is worse than no profile; a few lines in the file that loads at the start of every session is the thing that actually works.

Say that much now, so the interview doesn't feel like it went nowhere:

> I'm keeping this in mind for now. In two modules you get a file that every session on this machine reads before it does anything — that's where this belongs, and you'll write it there yourself.

## Do: show them what they can already do

Before installing anything, take two minutes on what's available in the tools they just named. They may have connectors already — email, Drive, Slack, a calendar — and if so, that's real capability sitting there unused. List what you can actually see and give one concrete example against something of theirs.

Keep it short. This is a preview, not module 9. The point is that useful work doesn't wait for the end of the walkthrough.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 1
Next: 2
```

Then say what's next in one sentence — who decides whether a command runs, and how to change that — and ask whether they want to continue.
