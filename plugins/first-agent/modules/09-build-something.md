# Module 9 — Build something you want (optional)

Goal: they've built one thing they actually wanted, they know how to write a spec another agent can follow, and they know how to check whether it was followed.

Time: 30–60 minutes, depending on what they pick.

This module is optional and their machine is already finished without it. Offer it as an opportunity, not a remaining obligation.

There is no prescribed subject and no prescribed output. Not a dashboard, not a chart, nothing that has to contain numbers. What they build is theirs to choose, and the whole value is that they'd use it again.

---

## Open

Put the choice to them plainly:

> Your computer is set up and there's nothing left outstanding. There's one optional exercise: I walk you through building, automating, or fixing something you actually want. Not a demo — a real thing.
>
> Pick something fairly low stakes, so you can experiment and make mistakes with it, but something that genuinely helps you. Half an hour to an hour. Want to do it now, save it for later, or skip it?

If they'd rather stop, close out with the section at the end and leave it there. Coming back later is a normal outcome.

**Low stakes does not mean pointless.** It means a task where a wrong answer is recoverable and nobody is waiting on it. A throwaway they'll never open again teaches them that this kind of work produces nothing — the opposite of the lesson. Their own work, taken one slice at a time, is the right target.

## Do: land on the thing

Start from what they told you in module 1 — the repetitive thing they'd rather not do. Propose it. If they want something else, take what they want without argument; the point is that they're motivated, not that the subject is optimal.

Then scope it, holding four lines:

- **One slice of the real thing, not a demo.** If it's a system, build the first step of it.
- **Small enough to finish today.** They should end with something that runs.
- **Reads before it writes.** Version one reports what it *would* do. Turning that into action is a small change once they trust the output.
- **Their data, their format.** The value is that it fits how they already work.

## Do: work out what it needs before building anything

This is a real step, not a formality, and it's where most first builds die.

Go through it with them out loud:

- **Where does the information come from, and can I reach it today?** Their own folder, a connector they already have, or something not connected yet.
- **Where does the result go?** A file, a message, a system.
- **Is there a step in the middle that needs judgement?** If so, that step stays theirs, and the tool's job is to prepare it rather than decide it.

If it turns out something isn't reachable, say so immediately and offer the choice rather than improvising around it:

> This needs access to X, which isn't connected. Two options: I set that up first, which is about twenty minutes, or we pick a version of this that works with what you already have. Either is fine.

Where a service has no built-in connector, that's module 8's territory — an official MCP server if one exists. If they use something like Zapier already, that's often the shortest path and worth naming. None of this is required today, and it's better to build something smaller that works than to spend the hour on plumbing.

## Teach: how to write a spec

This is the transferable skill in the module, and the reason not to hand them a template.

> A spec is a description of a job precise enough that someone with no context can do it. That's the test — not whether it's detailed, but whether it survives being read by someone who wasn't part of the conversation.

What one needs, in this order:

1. **What it's for**, in a sentence. The thing that decides every ambiguous choice later.
2. **The inputs** — where they come from, what they look like, what's true of them.
3. **The output** — what gets produced, in what shape, where it goes.
4. **The rules that can't be broken.** The things that are wrong if violated, even when the result looks fine. This is the part people leave out and it's the part that matters.
5. **What "done" means.** How anyone would check it worked.

Write it **with** them, in front of them, into a file in their project folder. Compose it out loud so they see the choices being made, and get them to say the "for" sentence in their own words rather than accepting your version.

There is an example spec at `templates/dashboard-spec.md` — one worked instance, for a page of sourced figures. Show it if a concrete example helps, and be clear it's an example of the shape rather than a target to hit.

## Do: hand it to a fresh session

> A session is one conversation with its own memory. Opening a second one gives you a worker that knows nothing about this conversation — which is exactly what you want, because the spec has to stand on its own.
>
> This window stays open. Come back here when it goes sideways.

How: in the desktop app, a new session pointed at the same folder. In the terminal, a new tab, `cd` to the folder, run `claude`. Side by side if their screen allows — watching it happen is most of the learning.

Give them a short brief to paste, pointing at the spec file by its real path and asking for the plan before the work.

Then stay out of the way. Things to prompt them toward, if they don't do them:

- **Ask for the plan** before anything gets built.
- **Look at the result themselves** rather than accepting that it's done.
- **Ask for one change** once it works. Changing something they built is the moment it becomes theirs.

## Teach: checking whether the spec was actually followed

This is the most useful technique in the walkthrough, and the framing matters — it isn't only for when something breaks.

> Every session writes down everything that happened in it, and another session can read that record. The obvious use is diagnosis: when a session is stuck, convinced a file exists or going in circles, asking it what went wrong is asking the confused party for a diagnosis. A fresh one reading the transcript has no stake in the story.
>
> The more useful use is checking your own instructions. You wrote a spec. Another agent, with no context, just tried to follow it. The transcript is a record of exactly where your instructions were clear and where they weren't.

The loop, which is the thing to leave them with:

1. Write the spec.
2. Run it in a fresh session that knows nothing.
3. Ask that session for its **session ID**.
4. Bring the ID back here, with the spec, and ask: what did it actually do, where did it diverge from what the spec asked for, and what in the spec caused that?
5. Fix the spec, not the output.

> That's how anything repeatable gets made reliable — a spec, a skill, a checklist. You don't improve it by rereading it. You improve it by watching someone follow it without you there.

Two practical notes:

- Tell the second session to **search the transcript for the relevant parts** rather than read all of it. A busy transcript is megabytes and reading it whole spends the context needed for the answer.
- Transcripts can be read but **not written to**, in any mode. A session can't alter its own record, which is why a second opinion drawn from it is worth having.

Have them do it once, on this build. Whatever happened is subject enough — a wrong turn, a misread instruction, even just a step that took longer than expected. The point is that they've done it once, so it's available when they need it.

## Do: keep it

Commit it. Then write a short `README.md` next to it: what it does, how to run it, where its credentials live, and what to check first if the output looks wrong. Three or four lines, written for them in three months.

## Teach: what keeping it running involves

Say this without softening it:

> This works now. It will break eventually, and knowing why in advance makes it a ten-minute fix rather than a dead end.

Three causes, with what changes:

- **The source moves.** A column gets renamed, a tab gets added, a report changes shape. It reads something that isn't there any more.
- **Access lapses.** A key gets rotated or a permission revoked. It stops with an authentication error.
- **What they want changes.** The most common one by far.

Then the part that matters:

> None of that requires you to have become an engineer. It requires you to notice when the output looks wrong, and to bring the actual error to a session instead of quietly going back to doing it by hand. Whoever built it maintains it, and that's now you — which is the trade for not having to wait on someone else to build it.

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
