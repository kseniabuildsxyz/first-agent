# Module 7 — Habits that keep sessions working

Goal: they know why a session degrades, what to do about it, what this costs, and how to recover when a run goes wrong.

Time: about 10 minutes.

Everything in this module is behavioural. It's also the difference between agents that stay useful and agents that seem to get worse over a week, so give it the same weight as the setup modules.

---

## Teach: why a long session gets worse

> Everything we've said in a conversation stays in front of me, and there's a ceiling on how much I can hold. Early on that's an advantage — I remember the context. Past a point it works against you: a failed approach from an hour ago is still sitting there, competing with what you just asked for.

Then the fix, which is one command:

> `/clear` empties it and starts fresh. Use it whenever you change topic. It isn't a reset button for something broken, it's ordinary hygiene — closing a file you're done with.

## Teach: four habits

One line each. These are the ones that matter, in order of how much they help.

**One task per session.** Finish a thing, `/clear`, start the next. Mixing three topics in one conversation is the most common reason an agent stops performing well.

**Two corrections, then start over.** If I've got something wrong twice, a third correction rarely lands — the wrong approach is now part of what I'm reading. `/clear` and describe the task again, including what you learned from the failures.

**Plan first for anything big.** Ask for the plan before the work when a task touches more than a couple of files. It's much cheaper to redirect a plan than a result.

**Ask for evidence, not assurance.** This one is important enough to say directly:

> I can tell you something worked when it didn't. Not on purpose — I lose track, or I assume a step succeeded. When it matters, ask to see the actual thing: the file, the output, the number. "Show me" costs you five seconds and it's the only reliable check.

## Teach: what this costs

Plain terms, no arithmetic:

- Every message sends the conversation so far, so long sessions cost more per message than short ones. `/clear` is also the cheap option.
- Reading large files is expensive. Pointing at the specific file beats asking me to go find it.
- Auto mode's reviewer adds a small cost per command. Worth it.
- Hitting a limit means waiting, not breaking. Nothing is lost.

If they're on a subscription, tell them where usage shows up so a limit isn't a surprise.

## Teach: when a run goes wrong

Give them the ladder in order. Most problems resolve at the first or second rung.

1. **Read the actual error.** Ask me to show it rather than summarize it. Errors usually name the problem.
2. **Ask what I just did.** A plain account of the last few actions often locates it immediately.
3. **`/clear` and re-ask.** With what you learned from the failure in the new description.
4. **Go back to the last saved version.** `git restore .` from module 5 — the files return, nothing lingers.
5. **Stop and say the approach isn't working.** Not every path is worth a fifth attempt, and I should have said so myself at rung two.

Worth telling them plainly: if they ever feel stuck and out of options, saying "this isn't working, what are my choices" is a good move, not a defeat.

## Do: practise it

Small and concrete. Have them:

- Run `/clear`, then ask you something that needs the profile from module 1. You read it from the file rather than remembering it — which shows what `/clear` costs, and why the file exists.
- Ask you to do something, then ask for the evidence rather than accepting the summary.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 7
Next: 8
```

Next: how to give an agent access to a tool it doesn't have yet, which is where most of the useful work comes from and where most of the risk is. Ask whether they want to continue.
