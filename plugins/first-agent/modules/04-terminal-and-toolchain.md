# Module 4 — The terminal and the missing tools

Goal: Homebrew, git, the GitHub CLI, and gitleaks are installed and working, they've used the terminal themselves, and this walkthrough is installed as a plugin.

Time: 20–30 minutes, most of it waiting on downloads.

This is the longest module and the only one where they type into a terminal themselves. Tell them that up front.

---

## Teach: what the terminal is

Keep it to what's useful:

> The terminal is a window where you type a command and the computer runs it. It's the same computer and the same files — Finder shows them as icons, the terminal shows them as text. Most tools that don't have an icon to double-click get installed this way.

Have them open it: **Cmd+Space**, type `terminal`, press enter. Have them leave it open beside this conversation.

Then the three things that make the terminal confusing the first time:

**A password you type is invisible.** No dots, no asterisks, no cursor movement. It looks like your keyboard stopped working. It didn't — type it and press enter.

**Silence means success.** Most commands print nothing when they work. An empty response is the good outcome. Errors are the ones that talk.

**You can check any tool by asking its version.** `brew --version` prints a number if Homebrew is installed and an error if it isn't. That's how you confirm something worked rather than assuming.

## Teach: what a package manager is

> Homebrew is an app store for tools that live in the terminal. Instead of hunting for a download page, you type `brew install thing` and it handles it. It's how nearly everyone on a Mac installs developer tools, and it's what the next few steps use.

## Do: install Homebrew

**They run this one, not you.** Explain why in one line: it needs their password, and passwords are theirs to type.

Give them the command from [brew.sh](https://brew.sh) and have them paste it into their terminal window:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Before they run it, point out what they're looking at, because this is the shape of the most common attack they'll encounter:

> This command downloads a script from the internet and runs it. That's normally something to refuse. It's acceptable here because the address is Homebrew's own, and you can check it — open brew.sh in a browser and confirm the command matches. Get in the habit of checking the address before you paste something like this.

Worth naming: if they'd asked you to run this, auto mode's reviewer would have blocked it, because downloading and executing code is on its default block list. That block is correct. This is the exception, verified by hand.

What to expect, so silence and delay don't read as failure:

- It asks for their password. Invisible while typing.
- It may install Apple's Command Line Tools first — the base set of developer tools every new Mac lacks. That step takes several minutes with a progress bar that appears frozen. It isn't.
- Total time is often 5–15 minutes.

## Do: make the terminal find Homebrew

On Apple Silicon Macs, Homebrew installs to `/opt/homebrew`, which the terminal doesn't check by default. The result is `brew: command not found` immediately after a successful install. It's the single most common snag at this step, and the installer prints the fix in its "Next steps" output.

Add the line Homebrew names to `~/.zprofile`, then load it into the current session with the `eval` line it gives.

Expect a permission prompt on the write even in auto mode — `~/.zprofile` is one of the protected files from module 2. Name it when it appears.

Then confirm with `brew --version`. Have **them** run it, in their terminal. First command they've run that reports back, and it's worth the beat.

## Do: install the rest

Now you can run things. Three tools:

```
brew install git gh gitleaks
```

One line each on what they're for:

- **git** — keeps a history of your files so you can go back. Next module.
- **gh** — talks to GitHub from the terminal.
- **gitleaks** — checks for passwords and keys before they get committed. Module 6.

Confirm each with `--version`.

## Do: connect their GitHub account

> GitHub is where code and shared tools live. You need an account to install things from it, and it's free.

If they don't have an account, send them to [github.com](https://github.com) to create one and wait. Account creation and password entry are theirs.

Then `gh auth login`. It's interactive, so walk them through the choices as they appear: GitHub.com, HTTPS, authenticate via browser. A code appears in the terminal, they paste it into the browser page that opens, and they approve.

Hand the browser to them. You never enter their credentials.

Confirm with `gh auth status`.

## Do: install this walkthrough as a plugin

Explain what a plugin is, now that they've got the tools to install one:

> A plugin is a bundle of instructions and small tools someone packaged up so you can install it in one step. This walkthrough is one. Installing it properly means the extra tools it comes with become available as commands you can call any time.

Run:

```
/plugin marketplace add kseniapylypiuk/first-agent
/plugin install first-agent@first-agent
```

Tell them what they just gained: `/first-agent:start` to resume this walkthrough, plus the three tools used in modules 6 and 8.

From here, read module files from the local `modules/` directory rather than over HTTPS.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 4
Next: 5
```

Note that the slow part is over, and that the next module is the one that makes everything afterwards safe to experiment with. Ask whether they want to continue.
