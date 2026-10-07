# Module 7 — Working habits

Goal: they know why a session degrades and what to do about it, they can start over deliberately rather than as a last resort, they know what this costs, and they know how to make the agent delegate its heavy work.

Time: about 15 minutes.

Before starting, re-read START.md — in particular "How to read a module."

Nothing gets installed. These habits decide whether the setup stays useful after the walkthrough ends, so give them the same weight as the installs. This module builds on module 3's teaching about context and compaction; refer back to it rather than teaching it again.

---

## Open

> This module is about the habits that keep an agent useful day to day: why a session gets worse as it goes on, when to start over, what all of this costs, and how to get me to hand off heavy work. It takes about fifteen minutes.

## Teach: why a long session gets worse

> In module 3 we covered one reason a long session gets worse. As a conversation grows, the middle of it gets read less carefully, an approach we abandoned can still pull on what I do next, and eventually the conversation is compacted into a summary that keeps the gist and loses the specifics.
>
> There's a second reason, and it's about how agents work. We tend to take the shortest route to something that looks like an answer, and most of the time that's what you want. Under pressure, though, with a crowded conversation and a couple of failed attempts already in it, that tendency turns into reading as little as possible and stating more than was actually checked.
>
> Put together, thoroughness can easily slip in a long session. The useful thing to hold an agent to is whether it actually looked, more than whether it seems to know the answer.

## Teach: the habits

Four, in order of how much they help. Several are already in their standing rules from module 3 — check `~/.claude/CLAUDE.md`, add only what's missing, and say which were already there. You write the file; they don't.

> I'm going to add these to your standing rules as well as telling you, so they hold whether or not either of us remembers them, but they are yours to edit anytime.
>
> **One task per session.** Finish one thing, clear the conversation, and start the next. Mixing three topics in one conversation fills it with material that has nothing to do with whichever topic you're on, and is a quick way to create a session that no longer performs.
>
> **Two corrections, then start over.** If an agent has got the same thing wrong twice, a third correction rarely helps, because the wrong approach is now part of what it's reading. You'll get further by starting a fresh session and describing the task again, including what the failed attempts taught you.
>
> **Ask for a plan first on anything big.** When a task touches more than a couple of files, ask for the plan before the work. Changing a plan costs you one message, whereas changing a finished result means redoing the work.
>
> **Ask for the heavy work to be handed off.** This one has its own section in a moment, because it changes how a long piece of work goes, and it's worth asking any agent for, not just me.

## Teach: why I stop on a data gap

One of the rules from module 3, and usually the first one they meet in practice.

> One of your standing rules tells agents to stop when data is missing, can't be reached, or is much smaller than expected, instead of carrying on with whatever is there. The reason is that a partial answer that looks complete is worse than no answer, because nothing on the screen tells you which part is missing. So when an agent stops and asks, that's the rule working, and the fastest way forward is usually to say where the rest of the data is.

## Teach: starting over

This is what turns a stuck session from a dead end into a short detour.

> A fresh session knows nothing about the conversation before it, which is usually the point: none of the wrong turns come with it.
>
> When an agent has gone in circles, more corrections rarely fix it. What works is asking it to write down what it tried, what worked, what didn't, and what it thinks the problem is, then handing that write-up to a fresh session. The new session gets what was learned without the confusion that came with it.
>
> You have three ways to clear the decks, and they differ in what they keep. **Compacting** replaces the conversation with a summary and carries on, so the gist survives and the detail doesn't; you can ask for it deliberately rather than waiting for it to happen on its own. **Clearing** keeps nothing at all and carries on in the same window, which is what you want when you move to something unrelated. **Starting a new session** leaves the current one open beside it, so you can still go back and read what happened there. That last one is the move when you want a second opinion rather than a clean slate, including pointing a fresh agent at a stuck one's transcript.

Show them where these live in their interface — `/compact` and `/clear` in a terminal, and a new session from the sidebar in the desktop app — but **don't have them clear or compact this session.** The walkthrough isn't finished, and there's nothing here worth losing to a demonstration. If they want to try one, a new session is the one with no cost.

## Teach: what this costs

> This is about **tokens**, which are the unit everything you do with an agent is measured and billed in. A token is roughly a short word or a piece of one, and everything counts: what you type, what an agent reads, every command and all of its output, and every word of the reply. A plan gives you an allowance of them, and the API charges for them directly.
>
> A few things follow from that, without the arithmetic.
>
> Every message an agent sends carries the whole conversation so far along with it, so the same question costs more in a long session than in a short one. That makes clearing the cheaper option as well as the sharper one.
>
> Reading large files is expensive, because every line read is tokens spent. Pointing an agent at the specific file costs far less than asking it to go and find it.
>
> If you hit a usage limit, you'll have to wait for it to reset, but nothing breaks and nothing you've done is lost.

If they're on a subscription, show them where their usage appears, so a limit isn't a surprise. Don't estimate figures you can't see.

## Teach: ask me to hand off the heavy work

This is the technique that keeps a session sharp through a large piece of work.

> Some jobs need a lot of fetching: querying a dataset, reading rows out of a spreadsheet, comparing two sources, or searching through a folder. I can do that work here in front of you, or I can hand it to a **subagent**, which is a separate worker I start, brief, and wait on. It does the heavy reading outside our session and comes back with the answer.
>
> That helps in three ways. Everything an agent pulls into a conversation stays there for the rest of the session, building up the context, so sending bulk work elsewhere means only the conclusion comes back. That keeps the orchestrating agent sharp for longer, because the kind of bulk a subagent absorbs is exactly what makes a long session degrade. It can also be faster and cheaper, because a subagent can run on a cheaper model, and several can run at the same time.
>
> When it happens, you'll see the hand-off announced, a pause while the subagent works, and then a summary. The raw material it read doesn't come back into this conversation, which is the point, but it isn't lost: each subagent keeps its own transcript, and you can look through what it did while it runs or afterwards. If you want the detail in the conversation itself, ask for it.
>
> This is already in your standing rules, so you shouldn't have to ask for it. When you want to be explicit anyway, the phrase is "delegate the heavy lifting and just bring me the answer," or more specifically, "send the data pull to a subagent." Saying it once at the start of a big job shapes how the whole thing goes.

This is already in their standing rules from module 3. Point that out: a rule they installed earlier is now doing something visible, which is the file working as intended.

> There's one caveat. A subagent only knows what it was told. A bad brief gets you a confident wrong answer, and the agent that sent it has only the summary in front of it, so it has less to notice the problem against. The work is still traceable in the subagent's own transcript, so a wrong answer can be checked, but the checking is something you have to ask for. Subagents are right for fetching and heavy reading, and the judgement call at the end should stay here, with you.

## Teach: when a run goes wrong

> When something goes wrong, there's a short sequence to work through, and most problems are resolved by the first or second step.
>
> First, read the actual error. Ask to see it in full rather than summarised, because a summary drops exactly the specifics that identify the fault: the file, the line, the value that was wrong.
>
> Second, ask what just happened. A plain account of the last few actions often locates the problem straight away.
>
> Third, ask for a write-up of what's been tried, and start a fresh session with it.
>
> Fourth, say that the approach isn't working. Not every path deserves another attempt, and "this isn't working, what are my options?" is one of the most useful things you can say.

## Holding the objective

What they should be able to do afterwards: notice when a session has started to slip, choose between clearing, a fresh session with a write-up, or handing work to a subagent, and recognise a stop on a data gap as intended.

If they push further, these are true and worth having ready:

- **"How do I know a session has started to slip?"** They're re-explaining things they already said, you're reaching for the wrong file, an earlier instruction has stopped being followed, or answers arrive confidently with nothing shown. Any of those is the cue.
- **"Will clearing lose my work?"** No. Files written to the folder stay; only the conversation goes. That's module 3's argument for putting anything durable in a file.
- **"Is a subagent a different AI?"** Another instance working from a narrower brief, sometimes on a smaller model. It sees only what it's given, and it writes its own transcript, so what it did can be read back.
- **"How do I see what I've spent?"** Show them where usage appears for their plan, and don't estimate figures you can't see.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 7
Next: 8
```

> Next is how to give an agent access to the tools your work actually lives in: your email, your documents, your other systems. Some of that may already be available. It takes about twenty minutes. Do you want to keep going?
