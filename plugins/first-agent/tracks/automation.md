# Track — Recurring work

For people whose time goes on the same sequence of steps every week, usually moving information between tools.

---

## Teach: what's worth automating

The instinct is to start with the most annoying task. The better filter is different:

> Automate the work that's the same every time. Something you do weekly with the same steps and the same inputs is a good candidate. Something that needs a judgment call at step three isn't — not because it can't be helped, but because the judgment is the work, and what you want there is a draft to react to rather than a finished result.

Two useful shapes, and the distinction saves them from building the wrong thing:

- **A script they run.** They decide when. Predictable, easy to check, easy to abandon.
- **Something that runs on a schedule.** Nobody decides. Faster, and it fails quietly when nobody's watching.

Start with the first. A scheduled job whose failures nobody notices is worse than the manual work it replaced.

## Teach: the part that gets skipped

> The interesting question isn't whether it works. It's what happens when it doesn't. If it runs Monday morning and the source file has moved, you need to find out from the tool, not from a colleague asking why their number is wrong.

So: version one reports what it did. Every time, whether or not anything went wrong. A line of output they'll actually see beats a log file they won't.

## Do: build one

Take the recurring task from their profile. Break it into steps out loud with them first — where the input comes from, what changes, where the result goes. Most tasks turn out to have a step nobody had articulated, and finding it is half the value.

Then build it as something they run by hand, that reads and reports before it writes anything.

Save it in `~/agent/projects/` with a name that says what it does.

## Do: put it in GitHub

> GitHub isn't only for code. It's a durable copy of anything you've built, with its history — so a mistake three weeks from now is recoverable, and moving to a new computer is a download rather than a rebuild.

Create a private repository with `gh repo create`, commit, push. Explain private versus public as they do it, and check whether anything in the folder shouldn't leave their machine before the first push. The commit check from module 6 covers keys; folder contents are still worth a look.

## Teach: scheduling, when they get there

Set one up when the task genuinely needs it, which is rarely on the first build. When they do:

- Have it report every run, not only failures. Silence is indistinguishable from success.
- Have it write somewhere they already look.
- Know how to turn it off, and write that down next to it.

## Build

Good first builds: a Monday summary assembled from two places they'd check by hand; a check that flags mismatches between two systems; a recurring report drafted from a source that already exists.

The test is whether they'd run it next week without being reminded.
