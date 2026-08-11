# First Agent

A guided setup that turns a new Mac into one you can build on with an AI agent — run by the agent itself.

About an hour. You won't write any code.

## Start here

You don't need to install anything first.

1. Download Claude Code from [claude.com/download](https://claude.com/download) and sign in.
2. In Finder, open your home folder — the one with your name on it — and make a new folder called `agent`.
3. Open Claude Code and point it at that `agent` folder.
4. Paste this and press enter:

```
Read https://raw.githubusercontent.com/kseniapylypiuk/first-agent/main/START.md and follow it exactly. I'm new to this — explain as you go and stop when you need me to do something.
```

That's it. The agent takes over. It will ask you questions, install what's missing, and stop when it needs your password or your hands on a browser.

You can quit partway through and pick up later — it keeps track of where you got to.

## What you end up with

- A machine set up so agents can do real work without stepping on anything
- Credentials stored where an agent can use them but never read them
- A standing set of rules that makes every future session better
- One working thing you built yourself

## What's in here

| Path | What it is |
|---|---|
| `START.md` | What the agent reads first |
| `plugins/first-agent/modules/` | The walkthrough, one file per module |
| `plugins/first-agent/tracks/` | The branch that matches your work |
| `plugins/first-agent/skills/` | Tools the agent gets after setup |
| `plugins/first-agent/templates/` | Files installed onto your machine |
| `plugins/first-agent/hooks/` | The check that blocks committing a key |
| `plugins/first-agent/antigravity/` | Same concepts for Google Antigravity |

## Requirements

macOS. Claude Code on any plan.

Windows and Linux aren't supported — parts of this rely on Homebrew and the macOS Keychain.
