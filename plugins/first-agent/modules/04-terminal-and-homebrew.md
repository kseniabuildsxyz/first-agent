# Module 4 — The terminal, and installing one thing safely

Goal: they understand what the terminal is, they can judge a command before running it, Homebrew is installed and working, and they've run a command themselves.

Time: about 10 minutes, longer only if Apple's Command Line Tools have to install first.

Before starting, re-read START.md — in particular "How to read a module."

The judgement taught here — how to look at a command someone hands you — outlasts the install. The Homebrew installer is a live example of exactly the pattern worth being careful about, which is why it's the first thing they install.

---

## Open

> This is the only module where you'll type into a terminal yourself, and the only one that needs your Mac password, typed by you. We'll install one tool, called Homebrew, and along the way I'll show you how to judge a command before you run it, which is the part you'll keep using long after today. It takes about ten minutes. The install itself is usually quick, and the one thing that can make it slow is if your Mac still needs Apple's basic developer tools, which it installs first.

Check whether Homebrew is already there before teaching anything — `command -v brew`, then `/opt/homebrew/bin/brew --version` and, on an Intel Mac, `/usr/local/bin/brew --version` — and report what you find. If it's installed and working, skip the install and the PATH step, but still teach how to judge a command.

## Teach: two things about how a Mac is arranged

These weren't relevant in module 1. They are now.

> Two things about how your Mac is organised are about to matter.
>
> The first is that tools you install from the terminal are installed for the whole computer, not for a particular folder. What we're about to install doesn't live in our `first-agent` folder and isn't tied to any project. Once it's installed it works from anywhere on this machine, and you won't need to install it again.
>
> The second is that any folder or file whose name starts with a dot, often called a dotfile, is hidden. Finder doesn't show them unless you ask it to, and that's where programs keep their settings. `~/.claude`, which holds the settings file and the rules file from module 3, is one of them. So when an agent mentions a file you've never seen, it's usually hidden rather than missing. If you ever want to see hidden files in Finder, pressing "Cmd"+"Shift"+"." turns them on and off.

## Teach: what the terminal is

> The **terminal** is a window where you type a command and your computer runs it. It uses the same engine that all apps on your computer do, but has a different mechanism to call out actions - text instead of buttons or UI elements. The terminal is also where most of my own work happens when I run commands for you.

**Show them how to open one before anything else.** Nobody knows what a terminal is until they're looking at it.

> Let's open one now, so it isn't abstract. In this app there's a terminal built in: the terminal icon at the top right opens it, and the plus button beside it opens another tab. You can also use your Mac's own: click the magnifying glass at the top right of your screen, type `terminal`, and press Return. Either one works for what we're doing.

**In a terminal**, they're already in one, and this conversation is using it; have them open a new tab with **Cmd+T** for the command they'll run themselves, so this conversation stays where it is.

Then the things that make a terminal confusing the first time:

> A few things about the terminal are confusing the first time, so here they are before you meet them.
>
> Nothing happens until you press Return. Typing a command only puts it on the line, and pressing Return is what runs it.
>
> When you type a password, nothing appears on screen. There are no dots or asterisks and the cursor doesn't move, so it looks as though the keyboard has stopped working. It's still receiving what you type, so type the password and press Return.
>
> Most commands print nothing when they succeed. An empty response usually means it worked, and it's the errors that print messages. You can ask for confirmation if you want it: a command that creates a file says nothing when it works, but you can tell it to create the file and then print "done", and it will. That's often worth doing while you're still getting used to the silence.
>
> An easy way to check whether a tool is installed is to ask for its version. `brew --version` prints a version number if Homebrew is installed and an error if it isn't, which is how you confirm something is there instead of assuming it.

## Teach: what a package manager is

> Homebrew is a **package manager**, a tool whose whole job is installing, updating and removing other tools. It's a lot like the App Store but for command line tools. Before package managers, installing a command-line tool meant finding the right download page, picking the right version for your machine, putting the files in the right place, and repeating all of that by hand whenever an update came out. Homebrew does it with one command, `brew install` followed by the tool's name, and it keeps track of what it installed so it can update or remove it cleanly later. On a Mac it's the standard way to install developer tools, and the next module uses it to install three tools that will likely make your life easier.

## Teach: how to judge a command before you run it

This is the transferable part of the module. The command they're about to run is the pattern to be careful about, so teach it while that command is in front of them.

> The command you're about to run downloads something from the internet and runs it straight away. That's normal, and it's worth a ten-second check first, because the same shape is how a lot of bad software gets installed.
>
> **Look at the address in the command.** It's written there in plain sight. Check that the domain is the project's own. This one points at Homebrew's own files, and brew.sh publishes this exact line, so you can compare the two.
>
> **If it's on GitHub, open the page.** How many people have starred it, when was it last updated, and what are people saying in the issues. Popular and actively maintained means a lot of people would have noticed if something were wrong.
>
> **Or know who gave it to you.** Something a colleague built won't have thousands of stars, and that's fine, because you know who to ask. What you don't want is a command pasted into a forum thread by a stranger with nothing behind it.
>
> Homebrew passes on the first two counts, which is why we're starting with it.

That's the whole check. Don't expand it into more criteria.

## Do: install Homebrew

**They run this one.** It needs their password, and passwords are theirs. Mark it clearly as a command for their terminal, not a message to you.

Give them the command from [brew.sh](https://brew.sh):

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then tell them what to expect, so silence and delay don't read as failure:

> Run this in the terminal we just opened. Here's what to expect, so a quiet screen doesn't look like a failure. It will ask for your Mac password, and as I mentioned, the password won't appear as you type it; press Return when you're done. It may then install Apple's Command Line Tools, which are the basic developer tools a new Mac doesn't come with. That part takes several minutes and its progress bar can look frozen while it's still working. Everything after it is quick.
>
> If anything looks like an error, come back here and tell me what it says. A failed install is an ordinary thing to work through, and it doesn't mean starting over.

## Do: make the terminal find Homebrew

Verify this yourself rather than asking them to check.

**Do this without narrating it.** It's a settings change you can make yourself, there's nothing in it for them to learn, and narrating it turns a non-event into a worry. If their standing rules say to propose changes first, START.md's precedence rule applies: say in one line which file you'll add to and what, and wait for a yes.

On an Intel Mac, Homebrew installs to `/usr/local`, which is already on the terminal's search path, so skip this step. On Apple Silicon, Homebrew installs to `/opt/homebrew`, which isn't on the terminal's default search path. The result is `brew: command not found` immediately after a successful install. Check `~/.zprofile` and `~/.zshrc` for an existing `brew shellenv` line first. If one is there, don't add another. Otherwise, check whether `~/.zprofile` exists, append to it rather than overwriting it, and add the line Homebrew names in its own "Next steps" output — easy to scroll past, which is why this step exists:

```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

If it doesn't work, say so and solve it with them rather than leaving them with a broken `brew`. Two things to handle straight after:

- **Your own shell doesn't read that file**, so prefix `/opt/homebrew/bin/` or export the path in commands you run for the rest of this walkthrough. Don't let a `command not found` in your own tooling read as a broken install.
- **Have them confirm the install themselves:**

> Let's check the install landed. Open a new terminal window, type `brew --version`, and press Return. It needs to be a new window: the one you already had open started before the settings changed, so it won't pick them up. A version number means Homebrew is installed and your terminal can find it.

This is the first command they've run that reports back. Give it a beat.

## Holding the objective

What they should be able to do afterwards: look at a command someone hands them and say where it comes from and whether that source is accountable, and confirm a tool is installed by asking for its version.

If they push further, these are true and worth having ready:

- **"Is Homebrew itself safe?"** It's open source, maintained by a named project, widely used, and installed from its own domain, which is what the command check looks for. It installs software other people wrote, so what they install with it deserves the same questions.
- **"What did the installer change on my computer?"** It installed Homebrew into `/opt/homebrew`, possibly Apple's Command Line Tools, and nothing in their documents. The `brew shellenv` line is the only settings change, and you wrote it, unless one was already there.
- **"Why did it need my password?"** Creating `/opt/homebrew` and installing the Command Line Tools both write to parts of the system that need administrator permission.
- **"How do I remove something I installed?"** `brew uninstall` followed by its name. Homebrew itself has an uninstall script published on brew.sh.
- **"What was that settings change you made?"** One line that tells the terminal where to find Homebrew. Show them the file if they ask; it's theirs.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 4
Next: 5
```

> Next is short: three small tools, installed with Homebrew where they're missing, and then installing this walkthrough onto your computer. So far I've been reading it off the internet, and installing it puts the modules on your machine along with a few commands that stay useful after we're finished. It takes about five minutes. Would you like to keep going?
