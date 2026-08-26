# Module 4 — The terminal, and installing one thing safely

Goal: they understand what the terminal is, they can judge a command before running it, Homebrew is installed and working, and they've run a command themselves.

Time: 15–20 minutes, most of it waiting on a download.

The judgement taught here — how to look at a command someone hands you — is worth more than the install. The Homebrew installer is a live example of the exact pattern, which is why it's the thing they install first.

---

## Open

Say up front: this is the module with the waiting in it, it's the only one where they type into a terminal themselves, and their password is needed once — typed by them.

Check whether Homebrew is already there before teaching anything, and report what you find.

## Teach: two facts about how a Mac is arranged

Now they're relevant, which they weren't in module 1.

- **Tools install once and work everywhere.** What you're about to install doesn't live in our folder and isn't tied to this project. Install it today, use it from anywhere, forget about it.
- **A folder whose name starts with a dot is hidden.** Finder doesn't show them. That's where programs keep their settings — `~/.claude` from the last module is one. It's why you'll hear about a file you've never seen: it was hidden, not missing.

## Teach: what the terminal is

> A window where you type a command and the computer runs it. Same computer, same files — Finder shows them as icons, the terminal shows them as text. Tools without an icon to double-click get installed this way.

**In the desktop app** the terminal is built in: the terminal icon at the top right opens it, and the plus button beside it opens another tab. They can watch a command run there. **In a terminal window**, have them open one with **Cmd+Space**, type `terminal`, press enter.

Then four things that make the terminal confusing the first time:

1. **Nothing happens until you press Return.** Typing a command doesn't run it. Return runs it.
2. **A password you type is invisible.** No dots, no asterisks, no cursor movement. It looks like the keyboard stopped working. It didn't — type it and press Return.
3. **Silence means success.** Most commands print nothing when they work. An empty response is the good outcome. Errors are the ones that talk.
4. **You can check any tool by asking its version.** `brew --version` prints a number if it's installed and an error if it isn't. That's how you confirm rather than assume.

## Teach: what a package manager is

> Homebrew is an app store for tools that live in the terminal. Instead of hunting for a download page, you type `brew install thing` and it handles it. It's how nearly everyone on a Mac installs developer tools, and the next module uses it.

## Teach: how to judge a command before you run it

This is the transferable part of the module, because it's the judgement they'll reuse for years.

The command they're about to run downloads a script from the internet and immediately executes it. Explain what to look at, in this order:

- **Where is it coming from?** The address is visible in the command. Open it in a browser and see whether it's the project's own site. `brew.sh` publishes this exact line — check that it matches.
- **Who benefits if it's wrong?** A command from a vendor's own domain, published in their own docs, has a reputation behind it. A command pasted into a forum answer or a chat message has nothing behind it.
- **Would you be able to tell?** A script that runs and then deletes itself leaves you nothing to inspect. That's the shape to be suspicious of.
- **Does it need your password, and does that make sense?** Installing system-wide software does. A one-line utility doesn't.

Then the general rule:

> Downloading something and running it immediately is the shape of most attacks you'll meet. It's fine here because you can check the source yourself and the source is the project. Build the habit of checking the address before you paste something like this — that check is the whole defence.

## Do: install Homebrew

**They run this one.** It needs their password, and passwords are theirs.

Give them the command from [brew.sh](https://brew.sh):

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

What to expect, so silence and delay don't read as failure:

- It asks for their Mac password. Invisible while typing. Return to submit.
- It may install Apple's Command Line Tools first — the base developer tools every new Mac lacks. Several minutes, with a progress bar that looks frozen. It isn't.
- 5–15 minutes total is normal.

Tell them to come back here with anything that looks like an error, and that a failed install is an ordinary thing to work through rather than a reason to start over.

## Do: make the terminal find Homebrew

Verify this yourself rather than asking them to check. It's your job, not theirs.

On Apple Silicon, Homebrew installs to `/opt/homebrew`, which the terminal doesn't look in by default. The result is `brew: command not found` immediately after a successful install.

Explain it this way, which is the version that lands:

> Homebrew is installed and working. The problem is your terminal doesn't know where it is — like a new starter who's in the building but not in the staff directory. They're here; you just can't look them up.
>
> The fix is one line in a settings file that tells your terminal to also look in `/opt/homebrew`. The file is `~/.zprofile`, it runs every time you open a terminal, and you don't have one yet. I'll create it.

Create it with the line Homebrew names in its own "Next steps" output — easy to scroll past, which is why this step exists:

```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Two things to handle straight after:

- **Your own shell doesn't read that file**, so prefix `/opt/homebrew/bin/` or export the path in commands you run for the rest of this walkthrough. Don't let a `command not found` in your own tooling read as a broken install.
- **Have them open a new terminal window** and run `brew --version` themselves. The old window started before the file existed and will never read it. This is the first command they've run that reports back — worth the beat.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 4
Next: 5
```

Say that the slow part is over. Next is short: three small tools, and installing this walkthrough so its extra commands are available. Ask whether they want to continue.
