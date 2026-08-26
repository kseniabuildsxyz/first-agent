# First Agent

A guided setup that turns a new Mac into one you can build on with an AI agent — run by the agent itself.

**macOS only.** Parts of this rely on Homebrew and the macOS Keychain. **Built for Claude**, in the desktop app or the terminal.

About two hours to set your machine up, plus an optional build at the end that takes another half hour to an hour. It's designed to be stopped and picked up later, so you don't need a free afternoon. You won't write any code.

## Start here

You don't need to install anything first.

1. Download Claude from [claude.com/download](https://claude.com/download) if you don't have it yet, install it, and sign in. A paid plan is required.
2. **On your Desktop, make a new empty folder** called `agent`. Starting somewhere empty means the agent begins with nothing of yours in reach.
3. Open Claude and click the **Code** tab at the top of the window.
4. Choose **Local**, click **Select folder**, and pick the `agent` folder you just made.
5. macOS will ask whether Claude can access that folder. Allow it. You may get a few more prompts for things like Photos or Google Drive — those are yours to decide and nothing here needs them.
6. Paste this into the chat and press enter:

```
Read https://raw.githubusercontent.com/kseniabuildsxyz/first-agent/main/plugins/first-agent/START.md and follow it exactly. I'm new to this — explain as you go and stop when you need me to do something.
```

That's it. The agent takes over. It will ask you questions, install what's missing, and stop when it needs your password or your hands on a browser.

You can quit partway through and pick up later — it keeps track of where you got to.

## What you end up with

- A machine set up so agents can do real work without stepping on anything
- Credentials stored where an agent can use them but never read them
- A standing set of rules, written in your words, that every future session reads
- A clear picture of what the agent can reach, and how to change it

## What's in here

| Path | What it is |
|---|---|
| `plugins/first-agent/START.md` | What the agent reads first |
| `plugins/first-agent/modules/` | The walkthrough, one file per module |
| `plugins/first-agent/skills/` | Tools the agent keeps after setup |
| `plugins/first-agent/templates/` | Your standing rules and deny rules, installed into `~/.claude/` |
| `plugins/first-agent/hooks/` | The check that blocks committing a key |

## Requirements

macOS. Claude on a paid plan.

**No GitHub account needed.** This is a public repository — installing from it downloads a copy, the same way any public file downloads. You don't need to sign up for anything, and nothing here will ask you to.

Windows and Linux aren't supported.
