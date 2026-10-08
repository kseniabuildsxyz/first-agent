# Module 1 — Getting set up, and what I can reach

Goal: they're in the right place with the right folder, they understand the two layers that decide what you can reach, and you have a profile of them to work from.

Time: about 15 minutes.

Before starting, re-read START.md.

---

## Open

> This module is about where we're working and what I can reach from here, plus a few questions about your work so the rest of the walkthrough fits the way you actually work. It takes about fifteen minutes, and nothing gets installed.

## Do: establish which interface they're in

Ask, because it changes the instructions for the whole walkthrough:

> Are you in the Claude desktop app, or in a terminal window?

**Desktop app** — the likely answer, and the one everything here assumes. Confirm they're in the **Code** tab, not Chat.

**Terminal** — if they're talking to you from a terminal, Claude Code is already installed and running, so there's nothing to set up. A few later steps differ in a terminal, and each module says where.

Record the answer. Everywhere below that names a button, adapt it.

## Do: confirm the folder

Check where you are with `pwd`. You should be in an empty folder called `first-agent` on their Desktop.

If they're somewhere else — their home folder, Documents, an existing project — say so plainly and fix it before continuing. The rest of this module isn't true from a folder full of their things. The folder a session can see is fixed when the session starts, so moving means starting a new session in the right folder and pasting the original message again. The progress file is already in their home folder, so the new session picks up where this one stopped.

> Right now I'm pointed at your whole home folder, which means your Documents, your Downloads and everything else on this computer are within my reach. That's more access than this walkthrough needs. Make an empty folder called `first-agent` on your Desktop, then start a new session there: in the Code tab, click the folder name at the top and choose the new folder. Paste the same message you started with, and I'll pick up from where we are now.

In a terminal, the equivalent is to quit, `cd ~/Desktop/first-agent`, and run `claude` again.

## Teach: the two layers that decide what I can reach

Now that it's true, say it. Lead with the fact that there are two separate layers, because they've already met the second one and it needs somewhere to land.

> Two separate things decide what an agent can reach on this computer. The first is the folder the session was started in. An agent can see that folder and everything inside it, and nothing outside it unless you give it access. Right now that folder is this one, and it's empty, so I can't see your Documents, your Downloads, your Photos, your email, or anything else on your computer until you give me explicit permission to open a directory that is not our current one.

Give it a moment. It's the first thing worth knowing, and starting in an empty folder is what makes it a fact rather than a reassurance.

Then the other half, which comes up the first time they want to work on something real:

> The flip side is that if you ask an agent to work on a file that lives elsewhere, it will tell you it can't reach it. Then you either move a copy into the folder it can see, or you point it at that folder deliberately. Widening what an agent can see is a decision you make.

Then the second layer:

> The second layer belongs to macOS, and you've already met it. When you chose this folder, your Mac asked whether Claude could access it, and you may have had a few more pop-ups since, about Photos, Music or Google Drive. Those come from the operating system, not from me. macOS protects certain folders, including Desktop, Documents and Downloads, and the first time any app reaches into one of them, it asks you before allowing it. Nothing in this walkthrough needs your Photos, Music or Google Drive, so you can decline those if you'd rather.
>
> The two layers work independently. The folder a session starts in decides what its agent is allowed to look at, and macOS decides what Claude as an app is allowed to touch at all, so both have to allow something before it can be opened. You can change the macOS side at any time in System Settings → Privacy & Security, and its prompts can reappear after an app update.

There's nothing for you to do in this section. It sits here because they clicked through these prompts before the walkthrough started — the README tells them to allow the folder — and an unexplained system prompt reads as alarm. If a macOS prompt appears later, module 6's sweep being the likely place, point back to this.

## Do: set up the folder

Create two folders inside `first-agent`:

```
projects/    things you're building
scratch/     experiments and throwaways
```

> I've made two folders in here. `projects` is for things you're building and want to keep, and `scratch` is for experiments you can throw away. Keeping everything agent-related in one place means you always know where to start a session and what each folder is for.

Then turn on version history for the folder — `git init`, a `.gitignore` holding `.DS_Store`, and a first commit. **You do this; they don't type anything and there is nothing to learn here.**

**Check for git first, with `xcode-select -p` and not with `git --version`.** On a Mac without Apple's Command Line Tools, `/usr/bin/git` is a stub that pops a system install dialog the moment it runs, and `xcode-select -p` answers the question without triggering it. If it reports no developer directory, git isn't usable yet: skip version history, say so in one line, note it in the progress file, and leave it to module 5, which installs git and turns it on then. Don't start an Apple install here — module 4 handles that as part of Homebrew.

> I've also turned on version history for this folder. That means I can save a restore point before I change anything substantial, and put things back the way they were if a change goes wrong. It runs in the background, and you won't need to manage it yourself.

If git doesn't know who they are, ask for a name and email rather than assuming, and mention these get stamped on saved versions and are visible if a folder ever goes to a shared host — a personal address is a reasonable choice for that reason.

Two later things depend on this existing: the checkpoint rule in their standing rules, and the key check in module 6. Both come after module 5, so deferring it is safe, but don't drop it.

Then flag what's coming:

> One thing to hold onto for later: passwords and keys need somewhere dedicated and secure to live, and we set that up in module 6. Until then, please don't paste any into this chat, because everything typed here is saved to a file on your computer.

## Do: learn what they work on

Open the interview by saying why it's happening:

> Before we go further, I'd like to understand what you actually do, so the rest of this walkthrough fits your work. An agent that knows what your job involves, where your work lives and what you'd rather not do by hand makes far better suggestions than one working from a job title. I'll ask a handful of questions and follow up on whatever you tell me.

Interview them conversationally — ask, listen, follow up. Cover:

- What they do, and what a normal week looks like
- **Where they do it** — which apps and tools they're in every day, and where their work actually lives
- One thing they do repeatedly that they'd rather not
- Anything on their computer or in their accounts you should leave alone

The last question matters most. Ask it directly and keep the answer in their own words. If they say "nothing, this machine is new," take that as given — and note that accounts aren't new even when a machine is, which module 8 will come back to.

**Don't write this to a file yet.** Hold it in the conversation. In module 3 they get a standing-rules file that every future session reads, and this is what goes at the top of it, in their words, in a file they own. A profile stashed in a folder nothing reads does nothing; a few lines in the file that loads at the start of every session is what actually works.

Say that much now, so the interview doesn't feel like it went nowhere:

> I'm holding onto this for now rather than saving it anywhere. In module 3 you'll get a file that every session on this machine reads before it does anything else, and that's where this belongs. We'll write it there together, in your words.

## Do: show them what they can already do

Before installing anything, take two minutes on what's available in the tools they just named. They may have connectors already — email, Drive, Slack, a calendar — and if so, that's real capability sitting there unused.

> Some of the tools you just mentioned may already be connected to me through your Claude account. Those connections are called **connectors**, and we'll cover them properly in module 8. Here's what I can see right now.

List what you can actually see and give one concrete example against something of theirs. If you can see none, say so in a sentence and move on.

Keep it short. This is a preview, not module 8. The point is that useful work doesn't have to wait for the end of the walkthrough.

## Holding the objective

What they should be able to do afterwards: say which folder you can see and how that changes, tell a macOS prompt apart from anything you asked for, and know where their agent work lives.

If they push further, these are true and worth having ready:

- **"Can you see my other folders if I ask you to?"** Only with their say-so. Reaching outside this folder is one of the actions that gets checked before it happens — module 2 covers how — and macOS may ask as well.
- **"What happens if I start a session in my home folder?"** Everything under it is in reach: Documents, Downloads, Desktop, and the hidden settings folders. Nothing breaks, but the boundary taught here stops meaning anything.
- **"What is version history actually doing?"** Recording a snapshot of the folder each time a restore point is saved. It's a local record and nothing leaves the machine. Module 5 installs a current version of the tool behind it, and module 6 adds a check that stops keys being recorded in it.
- **"Can you see my other sessions?"** Each session is its own conversation. What carries between them is covered in module 3.
- **"Why keep projects and scratch separate?"** So throwaway experiments never get mixed into something they want to keep, and so it's obvious where to start a session for each kind of work.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 1
Next: 2
```

> Next is about who decides whether a command I want to run actually runs, and how you change that. It takes about five minutes. Do you want to keep going?
