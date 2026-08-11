# Module 9 — Your first build

Goal: they have a working dashboard on a topic they chose, built by a second agent they directed themselves, and they've debugged one session from another.

Time: 25–40 minutes, most of it the second agent working while they watch.

The subject is deliberately not their job. The point is to learn the mechanics of directing a build on something with no stakes, so that when it's their real work in module 10 the only new thing is the subject matter.

**Your role changes in this module.** They open a second session to do the building. You stay open as the place they come back to when something goes wrong. Say that explicitly at the start — two windows, different jobs, and this one is the help desk.

---

## Do: pick a topic

Ask what they'd want to see laid out on one page. Anything with numbers and a story in it works.

If they hesitate, offer three, chosen from what you learned in module 1 — a hobby, a place, a thing they follow. Concrete beats clever:

- A sport's season — how a team's record moved, and against whom
- Somewhere they've lived — rents, transit, weather, population over twenty years
- Something they collect or follow — how prices, releases, or ratings have moved
- An industry they find interesting but don't work in
- A band, a book series, a director — output over time, reception, where it charted

Land on one in a couple of minutes. The topic matters much less than getting started.

## Teach: two sessions, two jobs

> A session is one conversation with its own memory. Opening a second one gives you a second worker who knows nothing about this conversation. That's usually what you want — the builder should start clean rather than carrying an hour of setup chatter.
>
> This window stays open. When the build goes sideways, come back here.

How to open one:

- **Terminal**: `Cmd+T` for a new tab, `cd` to the same folder, run `claude`.
- **Desktop app**: a new session or tab, pointed at the same folder.

Have them put the windows side by side if their screen allows it. Watching a build happen is most of the learning.

## Do: brief the second agent

Write them a prompt to paste into the new session. Compose it in front of them so they see how a brief gets built, then hand it over.

It needs: the topic, the research instruction, the spec, and where to save. Something like:

```
I want a single-page HTML dashboard about <topic>.

First, research it. Find real, current figures from sources you can cite —
at least four independent ones. Show me what you found and where each number
came from before you build anything.

Then build it to the spec at
~/.claude/plugins/.../templates/dashboard-spec.md
(read that file first).

Save it to ~/agent/projects/<name>/index.html
```

Resolve the real path to `templates/dashboard-spec.md` for them rather than leaving a placeholder.

Point out one thing about the brief before they send it: it asks for the sources **before** the build. That ordering is the whole difference between a dashboard that's right and one that looks right.

## Do: let them run it

Stay out of the way. They direct the second agent. Things worth prompting them to do, if they don't:

- **Look at the sources before approving the build.** Real URLs, and numbers that trace to them. If a figure has no source, it comes out.
- **Ask for the plan** before the HTML gets written.
- **Open the file in a browser** and look at it, rather than accepting the report that it's done.
- **Ask for one change** once it works. Changing something you built is the moment it becomes yours.

When it's open in their browser and they've read it, that's the module's win. Note it plainly.

## Teach: debugging one agent from another

This is the technique to make sure they leave with, because it converts a stuck session from a dead end into a normal problem.

Set it up honestly:

> Sometimes a session goes wrong in a way it can't see. It's convinced a file exists, or it's looping, or it did something twenty minutes ago that's causing trouble now. Asking it what went wrong is asking the confused party for a diagnosis.
>
> Every session writes down everything that happened in it. Another agent can read that record. So you can bring a fresh one in — one that has no stake in the story and can see the whole thing from outside.

Two steps, and the only thing that moves between windows is a line of text.

**In the session having trouble**, ask:

> "What's your session ID?"

It gives one back — a long string of letters and numbers. Have them copy it.

**In the other session**, paste it with the symptom:

> "Session ID <id>. Read that session's transcript and tell me what went wrong — I was trying to <x> and it <y>. The transcript is large, so search it for errors and read the end rather than the whole thing."

Every session writes to `~/.claude/projects/<working-folder>/<session-id>.jsonl`, so the ID is enough to find it.

That instruction about searching matters. A busy transcript runs to megabytes, and reading all of it spends the context needed for the fix.

Then have them try it for real. Whatever happened during the build — an error, a wrong turn, even a step that took longer than expected — is subject enough. Have them ask this session to read the builder's transcript and account for it.

Two things worth a line each:

- **Reading a transcript is allowed; writing to one is blocked** in every mode, so a session can't alter its own record. That's why a second opinion drawn from it is worth having.
- **`/resume`** returns to an earlier conversation, for when they want to continue one rather than diagnose it.

Tell them plainly that this generalizes: any time an agent is stuck, confused, or insisting on something that isn't true, a second one reading the record is the move. It's the most useful thing in this module and the thing they'll reach for soonest.

## Do: save it

Back in the build folder: `git init` if needed, commit, and note what it is. Their first build gets the same treatment as anything else.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 9
Next: 10
```

Then the last one: the same mechanics, aimed at their actual work. Ask whether they want to continue.
