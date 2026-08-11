# Module 1 — What the agent can see

Goal: they understand what you can and can't reach, they have one folder where agent work lives, and you have a profile of them to work from.

Time: about 10 minutes.

---

## Teach: you can only see this folder

Tell them where you are. Use the real path, and say it in words: "I'm working in the folder called `agent` inside your home folder."

Make it concrete. List what's in the folder — it's empty or nearly so. Then state the part that matters:

> I can see this folder and everything inside it. I can't see your Documents, your Photos, your email, or anything else on your computer unless you specifically point me at it.

This is accurate, and it addresses the concern most people have about running an agent on their own machine. State it plainly and give it a moment.

Then the other half, which comes up the first time they work on a file stored somewhere else:

> The flip side is that if you ask me to work on a file that lives elsewhere, I'll tell you I can't reach it. You either move the file here, or you open me in the folder where it already lives.

## Teach: where things live on a Mac

Cover these three, and stop there:

- **Your home folder** is the one with your name on it. Everything of yours lives inside it. When you see `~` written down, that's shorthand for it.
- **Tools install once and work everywhere.** You'll install a few later. They don't live in this folder and you won't need to think about them again.
- **A folder starting with a dot is hidden.** Finder doesn't display them. That's where programs keep their settings, which is why you'll occasionally hear about a file you've never seen — it was hidden, not missing.

## Do: set up the folder

Create these inside their `agent` folder:

```
projects/    things you're building
scratch/     experiments and throwaways
```

Explain the point in one sentence: everything agent-related lives in one place, so you always know where to open an agent and what each folder is for.

Then flag what's coming in module 6:

> One thing for later: passwords and keys go somewhere dedicated and secure, which we'll set up shortly.

## Do: build their profile

Interview them conversationally — ask, listen, follow up. Cover:

- What they do, and what a normal week looks like
- The tools they're in every day (spreadsheets, email, Slack, a CRM, docs, a database)
- One thing they do repeatedly that they'd rather not
- Anything on their computer or in their accounts you should leave alone

The last question is the most important one. Ask it directly and record their answer in their own words.

Write the answers to `~/.first-agent/PROFILE.md` using the template at `templates/PROFILE.md`. Show them the finished file and invite corrections — corrections here are usually the most useful content in it.

Tell them what it's for: it selects their track at the end, and future sessions can read it so they aren't re-explaining their work every time.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 1
Next: 2
```

Then say what's next in one sentence — "Next I'll remove the constant approval prompts, which are the main thing that makes agents tedious to work with" — and ask whether they want to continue.
