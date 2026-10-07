# Module 5 — Your tools, and where tools come from

Goal: git, gitleaks, and jq are installed and confirmed, this walkthrough is installed as a plugin, and they understand what they are and aren't trusting when they install something someone else wrote.

Time: about 5 minutes.

Before starting, re-read START.md — in particular "How to read a module."

The through-line is module 4's, applied to a second case: installing other people's software is normal, provided you know whose it is and can look at what's in it.

---

## Open

> This one is short. We'll install three small tools, then install this walkthrough itself as a plugin. It takes about five minutes, no password is needed, and nothing here asks you to make an account anywhere.

## Do: install the tools

Check what's already there before installing. `jq` ships with macOS 15 and later, so on a current machine it's already present:

```
jq --version
```

**git needs care.** Every Mac has `/usr/bin/git`, but on a machine without Apple's Command Line Tools it's a stub that pops a system install dialog the moment it runs. Check with `xcode-select -p`, which answers the question without triggering that. Install git here either way — Homebrew's copy is current and doesn't depend on Apple's:

```
brew install git gitleaks
```

Add `jq` to that line only if the check above came back empty.

**If module 1 deferred version history** because git wasn't usable then, turn it on now: `git init` in their `agent` folder, a `.gitignore` holding `.DS_Store`, and a first commit. Say in one line that it's done and update the progress file. If Apple's dialog does appear at any point, walk them through it — it's an Apple installer, it needs their click, and it's the same one Homebrew may have run in module 4.

Then say what each one is for:

> Three tools went in, and each has a specific job later in the walkthrough.
>
> **git** is the version history tool, the one behind the restore points on your `agent` folder. Every Mac can run a version of it, but the copy Apple ships has to be installed separately and is usually older, so this installs a current one that updates along with everything else Homebrew manages.
>
> **gitleaks** scans files for anything that looks like a password or a key. In module 6 we'll set it up so that it checks every change before an agent saves it into version history, and stops the save if it finds one.
>
> **jq** reads structured data. The check in module 6 uses it to read what an agent is about to do, so it knows when to step in.

Confirm each with `--version`. If `git --version` reports an older number than Homebrew installed, macOS's own copy is being found first. That's harmless; say so in a sentence so it isn't mysterious later.

## Teach: what a plugin is

> A **plugin** is a bundle of instructions and small tools someone has packaged so you can install it in one step. This walkthrough is a plugin. Up to now I've been fetching each module from the internet as we go; once it's installed, the modules live on your machine and I read them from there. You also get a few extra commands, which we'll use in module 6 and which stay available after the walkthrough is finished.

## Teach: no account needed, and when one would be

Say this before they see the word GitHub anywhere, because the instinct is to go and sign up.

> This walkthrough lives on GitHub, in a public **repository**, which is a folder on the internet that anyone can read. Installing from it downloads a copy, the same way any public file downloads, so it needs no account, no sign-in and no extra software.
>
> You'd want a GitHub account the day you want to put a folder somewhere other people can see it, or install something from a private repository. Neither is necessary today, and you can go a long time without needing either.

Do not send them to create an account. Do not install or run `gh`.

## Do: install this walkthrough as a plugin

> Plugins are installed from a **marketplace**, which is a list of plugins that someone publishes. We'll add the marketplace this walkthrough is listed in, then install the walkthrough from it.

**In the desktop app**, plugins install through the interface — there's no slash command for it. Walk them through it:

1. Click **Customize** in the sidebar.
2. Click **Plugins**.
3. Top right, **Add ▾** → **Add marketplace**.
4. In the **URL** field, type `kseniabuildsxyz/first-agent`. The shorthand is enough; no full address is needed.
5. **Sync**, then install **first-agent** from the list.

If they can't find **Customize** in the sidebar, it's also at the account menu at the **bottom left** → **Settings** (or **⌘,**) → **Customize**, at the foot of the list. Same panel either way.

While they're there, point out that **Customize** also holds **Skills** and **Connectors**. Connectors is module 8, and knowing where it lives now saves finding it later.

**In a terminal**, it's two slash commands, typed into this conversation rather than run as shell commands:

```
/plugin marketplace add kseniabuildsxyz/first-agent
/plugin install first-agent@first-agent
```

## Teach: the warning you're about to see

Warn them about the red notice in that dialog before they see it, and don't wave it away:

> When you add the marketplace, you'll see a red warning. It's accurate, and it applies to this walkthrough too. Anthropic doesn't review what's in a marketplace plugin, and can't promise that a plugin won't change after you install it. Your job is to know whose plugin you're installing and to have a way of looking at what's in it. This one is a single public repository under a named person's account, and you can read every file in it, including the module I'm reading from right now.

## If it doesn't install

Say so and carry on — the module files can be read directly and nothing downstream depends on the plugin. What they'd lose is `/first-agent:start` for resuming, the two helper commands module 6 runs, and `/first-agent:add-mcp` for later. Note it in their progress file so it's written down.

From here, read module files from the local `modules/` directory rather than over HTTPS.

## Holding the objective

What they should be able to do afterwards: say what each of the three tools is for, and explain what they are and aren't trusting when they install a plugin.

If they push further, these are true and worth having ready:

- **"What can a plugin actually do?"** Add instructions an agent follows, add commands, and add hooks, which are small scripts that run automatically at set moments — the commit check in module 6 is one. That's why whose it is matters: a plugin's instructions get followed.
- **"Can a plugin change after I install it?"** Yes. Its contents can change when it's updated from its marketplace, which is what the red warning is about.
- **"How do I remove it?"** Customize → Plugins in the desktop app, or `/plugin` in a terminal.
- **"Why not just use the git that came with macOS?"** It works. Homebrew's copy is newer and updates along with everything else Homebrew installs.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 5
Next: 6
```

> Next is where your passwords and keys should live, plus a check of your computer for any that are sitting somewhere they shouldn't be. The next module should improve the safety of your device and your future coding sessions. It takes about twenty minutes. Would you like to keep going?
