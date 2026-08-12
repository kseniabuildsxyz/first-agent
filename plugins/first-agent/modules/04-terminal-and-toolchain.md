# Module 4 — The terminal and the missing tools

Goal: Homebrew, git, the GitHub CLI, and gitleaks are installed and working, they've run a command themselves, and this walkthrough is installed as a plugin.

Time: 20–30 minutes, most of it waiting on downloads.

---

## Open

Say up front: this is the longest module, most of it is watching things download, and it's the only one where they type into a terminal themselves. Their password is needed once, and they type it.

Check what's already there before teaching anything — `git` usually ships with macOS, the rest usually don't. Report what you find.

## Teach: two facts about how a Mac is arranged

Now they're relevant, which they weren't in module 1.

- **Tools install once and work everywhere.** The ones below don't live in our folder and aren't tied to this project. Install them today, use them from anywhere, forget about them.
- **A folder whose name starts with a dot is hidden.** Finder doesn't show them. That's where programs keep their settings — `~/.claude` from the last module is one. It's why you'll hear about a file you've never seen: it was hidden, not missing.

## Teach: what the terminal is

> A window where you type a command and the computer runs it. Same computer, same files — Finder shows them as icons, the terminal shows them as text. Tools without an icon to double-click get installed this way.

**In the desktop app** the terminal is built in: the terminal icon at the top right opens it, and the plus button beside it opens another tab. They can watch a command run there. **In a terminal window**, have them open one with **Cmd+Space**, type `terminal`, press enter.

Then four things that make the terminal confusing the first time:

1. **Nothing happens until you press Return.** Typing a command doesn't run it. Return runs it. This catches people out on every prompt that follows, including the sign-in below.
2. **A password you type is invisible.** No dots, no asterisks, no cursor movement. It looks like the keyboard stopped working. It didn't — type it and press Return.
3. **Silence means success.** Most commands print nothing when they work. An empty response is the good outcome. Errors are the ones that talk.
4. **You can check any tool by asking its version.** `brew --version` prints a number if it's installed and an error if it isn't. That's how you confirm rather than assume.

## Teach: what a package manager is

> Homebrew is an app store for tools that live in the terminal. Instead of hunting for a download page, you type `brew install thing` and it handles it. It's how nearly everyone on a Mac installs developer tools, and the next few steps use it.

## Teach: how to judge a command before you run it

This is worth more than anything else in the module, because it's the judgement they'll reuse for years. The Homebrew installer is a live example of the pattern, so teach it here.

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

## Do: install the rest

Now you can run things:

```
brew install git gh gitleaks
```

One line each on what they're for:

- **git** — keeps a history of your files so you can go back. Next module.
- **gh** — lets the terminal talk to GitHub.
- **gitleaks** — checks for passwords and keys before they get committed. Module 6.

Confirm each with `--version`. If `git --version` reports an older number than Homebrew installed, macOS's own copy is being found first. Harmless, and worth one sentence so it isn't mysterious later.

## Do: connect their GitHub account

> GitHub is where code and shared tools live. You need a free account to install things from it.

If they don't have one, send them to [github.com](https://github.com) and wait. Account creation and passwords are theirs.

Then **they run** `gh auth login`. It's interactive, so walk the choices as they appear: GitHub.com, HTTPS, authenticate via browser.

Flag the part that's easy to miss:

> It shows you a one-time code in the terminal, then opens your browser. You have to go back to the terminal window to read the code, and it isn't obvious that it's waiting there. If you lose track of what it's asking for, come back and tell me what's on screen.

Hand the browser to them. Never enter their credentials. Confirm with `gh auth status` — note that the token comes back masked, which is a preview of module 6.

## Do: install this walkthrough as a plugin

> A plugin is a bundle of instructions and small tools someone packaged so you can install it in one step. This walkthrough is one. Installing it means the extra tools it comes with become commands you can use any time.

**In the desktop app**, plugins install through Settings — there's no slash command for it. Walk them through it:

1. Click their name at the **bottom left** of the sidebar.
2. **Settings**, or **⌘,**.
3. In the left rail, under **Customize**, click **Plugins**.
4. Top right, **Add ▾** → **Add marketplace**.
5. In the **URL** field, type `kseniabuildsxyz/first-agent`. The shorthand is enough — no full address needed.
6. **Sync**, then install **first-agent** from the list.

**Warn them about the red notice** in that dialog before they see it, and don't wave it away:

> That warning is accurate, and it applies to this walkthrough too. Anthropic doesn't review what's in a marketplace plugin and can't promise it won't change later. The reasonable response isn't to avoid plugins — it's to know whose plugin it is and to have some way of looking at what's in it. Everything here is in one public repository you can read.

**In a terminal**, it's two slash commands typed into the chat rather than the terminal:

```
/plugin marketplace add kseniabuildsxyz/first-agent
/plugin install first-agent@first-agent
```

If the install fails either way, say so and carry on — the module files can be read directly and nothing downstream depends on the plugin. What they'd lose is `/first-agent:start` for resuming, and the three helper commands used in modules 6 and 8. Note it in their progress file so it's written down.

From here, read module files from the local `modules/` directory rather than over HTTPS.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 4
Next: 5
```

Note that the slow part is over, and that the next module is short and is what makes everything afterwards safe to experiment with. Ask whether they want to continue.
