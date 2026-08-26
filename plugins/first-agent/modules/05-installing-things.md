# Module 5 — Your tools, and where tools come from

Goal: git, gitleaks, and jq are installed and confirmed, this walkthrough is installed as a plugin, and they understand what they are and aren't trusting when they install something someone else wrote.

Time: about 10 minutes.

The through-line is the one from module 4, applied to a second case: you don't avoid installing things, you know whose they are and you can look at what's in them.

---

## Open

Two lines: three small tools and this walkthrough itself. Quick, no password needed, and nothing here asks them to make an account.

## Do: install the tools

Check what's already there before installing. `git` usually ships with macOS. `jq` ships with macOS 15 and later, so on a current machine it's already present — check rather than assume, and say what you found:

```
git --version
jq --version
```

Install what's missing:

```
brew install git gitleaks
```

Add `jq` to that line only if the check above came back empty.

One line each on what they're for:

- **git** — keeps a history of your files so you can go back. Next module.
- **gitleaks** — checks for passwords and keys before they get committed. Module 7.
- **jq** — reads structured data. The key check in module 7 uses it.

Confirm each with `--version`. If `git --version` reports an older number than Homebrew installed, macOS's own copy is being found first. Harmless, and worth one sentence so it isn't mysterious later.

## Teach: what a plugin is

> A plugin is a bundle of instructions and small tools someone packaged so you can install it in one step. This walkthrough is one. Installing it means the extra tools it comes with become commands you can use any time, and I read the modules from your own machine instead of fetching them.

## Teach: no account needed, and when one would be

Say this before they see the word GitHub anywhere, because the instinct is to go and sign up.

> This walkthrough lives in a public repository — a folder on the internet that anyone can read. Installing from it downloads a copy. That's all it is, and it needs no account, no sign-in, and no extra software.
>
> You'd want an account there the day you want to put a folder somewhere other people can see it, or install something from a private repository. Neither is today, and you can go a long time without either.

Do not send them to create an account. Do not install or run `gh`.

## Do: install this walkthrough as a plugin

**In the desktop app**, plugins install through Settings — there's no slash command for it. Walk them through it:

1. Click their name at the **bottom left** of the sidebar.
2. **Settings**, or **⌘,**.
3. In the left rail, under **Customize**, click **Plugins**.
4. Top right, **Add ▾** → **Add marketplace**.
5. In the **URL** field, type `kseniabuildsxyz/first-agent`. The shorthand is enough — no full address needed.
6. **Sync**, then install **first-agent** from the list.

**In a terminal**, it's two slash commands typed into the chat rather than the terminal:

```
/plugin marketplace add kseniabuildsxyz/first-agent
/plugin install first-agent@first-agent
```

## Teach: the warning you're about to see

**Warn them about the red notice** in that dialog before they see it, and don't wave it away:

> That warning is accurate, and it applies to this walkthrough too. Anthropic doesn't review what's in a marketplace plugin and can't promise it won't change later. The reasonable response isn't to avoid plugins — it's to know whose plugin it is and to have some way of looking at what's in it. Everything here is in one public repository you can read, including the file you're reading right now.

That's the same judgement as module 4's, one level up. There it was a command from a vendor's own domain. Here it's a bundle from a named person's public repository. Neither is trusted blindly; both are checkable, and checking is the habit.

## If it doesn't install

Say so and carry on — the module files can be read directly and nothing downstream depends on the plugin. What they'd lose is `/first-agent:start` for resuming, the two helper commands module 7 actually runs, and `/first-agent:add-mcp` for later. Note it in their progress file so it's written down.

From here, read module files from the local `modules/` directory rather than over HTTPS.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 5
Next: 6
```

Next is short and is what makes everything afterwards safe to experiment with. Ask whether they want to continue.
