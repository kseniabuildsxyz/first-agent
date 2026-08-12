# Module 7 — Working habits

Goal: they know why a session degrades and what to do about it, they can start over deliberately rather than as a last resort, they know what this costs, and they ask for evidence.

Time: about 10 minutes.

Nothing gets installed. This is the module that decides whether they're still using any of this in six months, so give it the same weight as the setup.

---

## Open

Two lines: no installing, all habits. The most useful ten minutes in the walkthrough and the easiest to skim.

## Teach: why I get worse in a long session, honestly

The usual framing is that the agent "forgets," and it's worth correcting because the real mechanism tells them what to do about it.

> I don't forget things. I read what's in front of me. But two things are true at once, and together they cause most of what feels like an agent getting worse.
>
> **There's a ceiling on how much I can hold**, and a long session fills it. Once it's full, the earliest things get squeezed out — including instructions you gave me at the start, and including the standing rules that loaded before we began.
>
> **I'm built to be efficient**, which is a polite way of saying I take the shortest route to something that looks like an answer. That's usually what you want. But under pressure — a full context, three failed attempts already in the conversation — efficient turns into reading as little as possible and asserting more than I checked.

Then what follows from it, which is the actual point:

> So the thing that degrades isn't my knowledge, it's my thoroughness. That's what you have to hold the line on: not whether I know something, but whether I actually looked.

## Teach: the habits

Four, in order of how much they help. Add each one to `~/.claude/CLAUDE.md` as you go, and tell them you're doing it:

> I'm putting these in your standing rules as well as telling you, so they hold whether or not you remember them. Yours to cut, same as the rest of that file.

**One task per session.** Finish a thing, clear, start the next. Mixing three topics in one conversation is the fastest way to a session that stops performing.

**Two corrections, then start over.** If the same thing has been got wrong twice, a third correction rarely lands — the wrong approach is now part of what's being read. Better to start fresh and describe the task again, including what the failures taught them.

**Plan first for anything big.** Ask for the plan before the work when a task touches more than a couple of files. Much cheaper to redirect a plan than a result.

**Ask for evidence, not assurance.** The one that matters most:

> I can tell you something worked when it didn't. Not deliberately — I lose track, or I assume a step succeeded because I intended it to. When it matters, ask to see the actual thing: the file, the output, the number. "Show me" costs five seconds.

## Teach: starting over is a normal move, not a failure

This is what turns a stuck session from a dead end into a two-minute detour, and it's rarely taught.

> A fresh session is cheap. It knows nothing about this conversation, which is usually the point — none of the wrong turns come with it. Clearing when you change topic isn't a reset button for something broken, it's ordinary hygiene, like closing a file you've finished with.

Then the version for when something has actually gone wrong:

> When I'm stuck and going in circles, the move is not to keep correcting me. It's to ask me to write down what I've tried, what worked, what didn't, and what I think the problem is — then hand that to a fresh session. You get the accumulated knowledge without the accumulated confusion.
>
> The write-it-down step is what makes this work. Starting over without it means the new session repeats the same three dead ends.

Cover the two ways to leave a session, one line each:

- **Clear** empties the current conversation and carries on in the same place.
- **A new session** runs alongside this one, so both stay open. Useful when they want a second opinion rather than a clean slate — including asking a fresh agent to look at what the stuck one has been doing.

## Teach: what this costs

Plain terms, no arithmetic:

- Every message sends the conversation so far, so long sessions cost more per message than short ones. Clearing is also the cheap option.
- Reading large files is expensive. Pointing at the specific file beats asking someone to go find it.
- Hitting a limit means waiting, not breaking. Nothing is lost.

If they're on a subscription, tell them where usage shows up so a limit isn't a surprise.

## Do: practise asking for evidence

Do this rather than describe it, and pick something where the answer is genuinely ambiguous — the lesson is not that numbers get invented, it's that a correct answer can be to a slightly different question than the one they asked.

Something with a hidden judgement call in it works best. Count something in their folder where you have to decide what counts, answer with the number alone, then have them ask you to prove it. When you show the working, show the decision you made silently — what you included, what you excluded, and that they'd have had no way to know.

> That's the real shape of it. Not me inventing a number — me giving you a correct number to a question slightly different from the one you asked. Asking to see the working is how you catch it, and it took you two words.

Then say the harder version out loud, because it will happen to them:

> The worse case is that I tell you something is done when it isn't. I'll say a file is written, or a change is made, and it won't be — because I described the step instead of taking it. Nothing in the conversation looks wrong. The only thing that catches it is asking to see the result, especially before you clear a session or walk away.

## Teach: when a run goes wrong

The ladder, in order. Most things resolve at the first or second rung.

1. **Read the actual error.** Ask to see it rather than a summary. Errors usually name the problem.
2. **Ask what just happened.** A plain account of the last few actions often locates it immediately.
3. **Ask for a write-up, then start a fresh session** with it.
4. **Go back to the last saved version** — `git restore .` from module 5.
5. **Say the approach isn't working.** Not every path deserves a fifth attempt.

And plainly: saying *"this isn't working, what are my options"* is a good move, not a defeat.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 7
Next: 8
```

Next: how to give an agent access to a tool it doesn't have yet — their email, their spreadsheets, their systems. Ask whether they want to continue.
