# Module 9 — Build something you want (optional)

Goal: they've built one thing they actually wanted, they know how to write a spec another agent can follow, and they know how to check whether it was followed.

Time: 30–60 minutes, depending on what they pick.

Before starting, re-read START.md — in particular "How to read a module."

This module is optional and their machine is already finished without it. Offer it as an opportunity, not a remaining obligation.

There is no prescribed subject and no prescribed output. Not a dashboard, not a chart, nothing that has to contain numbers. What they build is theirs to choose, and the whole value is that they'd use it again.

---

## Open

Put the choice to them plainly. If module 8 left anything outstanding, say so here instead of claiming nothing is.

> Your computer is set up, and there's nothing outstanding. There's one optional exercise left: I walk you through building, automating or fixing something you actually want, using a real piece of your work instead of a demonstration.
>
> Pick something fairly low stakes, so you can experiment and make mistakes with it, but something that would genuinely help you. It takes between half an hour and an hour. Would you like to do it now, save it for later, or skip it?

If they'd rather stop, close out with the section at the end and leave it there. Coming back later is a normal outcome.

**Low stakes does not mean pointless.** It means a task where a wrong answer is recoverable and nobody is waiting on it. A throwaway they'll never open again teaches them that this kind of work produces nothing, which is the opposite of the lesson. Their own work, taken one slice at a time, is the right target.

## Do: land on the thing

Read the `## About my work` section of `~/.claude/CLAUDE.md` — the repetitive thing they'd rather not do is written there, in their words, from module 1. Propose it. If they want something else, take what they want without argument; the point is that they're motivated, not that the subject is optimal.

Then scope it, holding four lines:

- **One slice of the real thing, not a demo.** If it's a system, build the first step of it.
- **Small enough to finish today.** They should end with something that runs.
- **Reads before it writes.** Version one reports what it *would* do. Turning that into action is a small change once they trust the output.
- **Their data, their format.** The value is that it fits how they already work.

## Do: work out what it needs before building anything

This is a real step, and it's where first builds most often stall.

Go through it with them out loud:

- **Where does the information come from, and can you reach it today?** Their own folder, a connector they already have, or something not connected yet.
- **Where does the result go?** A file, a message, a system.
- **Is there a step in the middle that needs judgement?** If so, that step stays theirs, and the tool's job is to prepare it rather than decide it.

If it turns out something isn't reachable, say so immediately and offer the choice rather than improvising around it:

> This needs access to X, which isn't connected yet. There are two ways forward: I can set that up first, which takes about five to fifteen minutes, or we can pick a version of this that works with what you already have. Which one do you prefer?

Where a service has no built-in connector, that's module 8's territory — an official MCP server if one exists. If they already use something like Zapier, that's often the shortest path and worth naming. None of this is required today, and something smaller that works is better than an hour spent on plumbing.

## Teach: how to write a spec

This is the transferable skill in the module, and the reason not to hand them a template.

> A **spec** is a description of a job, written precisely enough that someone with no context could do it. The way to judge one is to ask whether it would still work if it were read by someone who wasn't part of the conversation that produced it. Detail only helps as far as it serves that.
>
> A spec needs five things, in this order.
>
> 1. **What it's for**, in one sentence, because that sentence is what settles every ambiguous choice later.
> 2. **The inputs:** where they come from, what they look like, and what's true of them.
> 3. **The output:** what gets produced, in what shape, and where it goes.
> 4. **The rules that can't be broken**, meaning the things that make the result wrong even when it looks fine. That's the part most often left out, and it's the part that matters most.
> 5. **What "done" means**: how anyone would check that it worked.

Write it **with** them, in front of them, into a file in their project folder. Compose it out loud so they see the choices being made, and get them to say the "for" sentence in their own words rather than accepting your version.

If a concrete example helps, write a short one **for what they actually chose**, not a generic one. Five lines is enough to show the shape:

```markdown
# Weekly supplier check

**For:** catching price changes before they reach an invoice, without opening twelve PDFs.
**In:** the PDFs in ~/Desktop/agent/projects/suppliers/, one per supplier, monthly.
**Out:** a markdown file listing any line item whose price moved more than 2% since last month.
**Rules:** never guess at an unreadable figure — list it as unreadable. Don't edit the PDFs.
**Done when:** I can name the changed items from the file without opening a PDF.
```

Then throw it away and write theirs. The example is there to show that five short lines can be a real spec, not to be filled in like a form.

## Do: hand it to a fresh session

> You know from module 3 that a session is one conversation with its own memory. A second session starts with none of this one, which is exactly what you want here, because the spec has to stand on its own.
>
> This window stays open while you do it. If things go sideways over there, come back here and tell me what happened.

How: in the desktop app, a new session pointed at the same folder. In a terminal, a new tab, `cd` to the folder, run `claude`. Side by side if their screen allows, because watching it happen is most of the learning.

Give them a short brief to paste, pointing at the spec file by its real path and asking for the plan before the work.

Then stay out of the way. Things to prompt them toward, if they don't do them:

- **Ask for the plan** before anything gets built.
- **Look at the result themselves** rather than accepting that it's done.
- **Ask for one change** once it works. Changing something they built is the moment it becomes theirs.

## Teach: checking whether the spec was actually followed

The framing matters here: this is for checking instructions, and not only for when something breaks.

> As we covered in module 3, every session keeps a complete record of what happened in it, called a **transcript**, and another session can read that record. The obvious use is diagnosis. When a session is stuck, convinced a file exists or going in circles, asking it what went wrong means asking the confused party for its own diagnosis, while a fresh session reading the transcript has no stake in the story.
>
> The more useful use is checking your own instructions. You've written a spec, and another agent with no context has just tried to follow it. Its transcript records exactly where your instructions were clear and where they weren't.
>
> Here's the loop. Write the spec. Run it in a fresh session that knows nothing about this one. Ask that session for its **session ID**. Bring the ID back here along with the spec, and ask what the other session actually did, where it departed from the spec, and what in the spec caused that. Then fix the spec, rather than the output.
>
> That's how anything you want to repeat becomes reliable, whether it's a spec, a skill or a checklist. Rereading it yourself won't show you where it's unclear, because you already know what you meant. Watching someone else follow it without you there will.

Two practical notes:

- Tell the second session to **search the transcript for the relevant parts** rather than read all of it. A busy transcript is megabytes, and reading it whole spends the context needed for the answer.
- A session's transcript is a record of what happened, written as it happens, so what a second session reads is what the first one did rather than its account of it. That's what makes the second opinion worth having.

Have them do it once, on this build. Whatever happened is subject enough — a wrong turn, a misread instruction, even a step that took longer than expected. The point is that they've done it once, so it's available when they need it.

## Do: keep it

Commit it. Then write a short `README.md` next to it: what it does, how to run it, where its credentials live, and what to check first if the output looks wrong. Three or four lines, written for them in three months.

## Teach: what keeping it running involves

Say this without softening it:

> This works now. At some point it will stop working, and knowing the likely reasons in advance turns that into a ten-minute fix instead of a dead end.
>
> There are three usual causes. The source moves: a column gets renamed, a tab gets added, or a report changes shape, and it goes looking for something that isn't there any more. Access lapses: a key gets rotated or a permission is revoked, and it stops with an authentication error. Or what you want from it changes, which is the most common of the three.
>
> None of that requires you to become an engineer. It requires noticing when the output looks wrong, and bringing the actual error to a session instead of quietly going back to doing it by hand. Whoever built something maintains it, and here that's you, which is the trade for not having to wait for someone else to build it.

## Holding the objective

What they should be able to do afterwards: write a spec another session can follow, and use a transcript to find where it wasn't followed.

If they push further, these are true and worth having ready:

- **"How is a spec different from a prompt?"** A prompt is a message inside one conversation. A spec is a file that stands on its own and can be handed to any session, any number of times.
- **"When should this become a skill?"** When they find themselves handing the same spec to fresh sessions again and again. A skill is a packaged set of instructions that loads when it's relevant, and a good spec is most of what one contains.
- **"Can I schedule this to run by itself?"** It's possible, but not before it has been run by hand often enough to trust the output. Reading before writing matters even more for anything unattended.

## Close out

Update `~/.first-agent/progress.md` to complete, then briefly:

- **What they have**, in one line. Not a recap of nine modules.
- **Their rules** live at `~/.claude/CLAUDE.md` and are theirs to change as they learn what they prefer.
- **The commands they kept**, with a line each on when to reach for them:
  - `/first-agent:scan-my-machine` — after connecting anything that hands them a credentials file
  - `/first-agent:add-mcp` — before installing a server someone else wrote
  - `/first-agent:secrets` — whenever a key needs storing or using
  - `/first-agent:start` — to resume this walkthrough
- **The one technique to remember**: hand a stuck or finished session's ID to a fresh one and ask what actually happened.

Then stop. No summary of the journey.
