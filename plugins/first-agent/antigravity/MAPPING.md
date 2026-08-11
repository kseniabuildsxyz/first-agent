# Using this with Google Antigravity

The walkthrough is built for Claude Code. Antigravity is a different application with the same underlying ideas and different names for them.

Modules 1, 4, 5, 6, 7, and 9 apply as written — folder scope, the terminal and toolchain, git, the Keychain, session habits, and the build are all properties of the machine rather than the app. Modules 2, 3, and 8 need translation.

## What's called what

| Concept | Claude Code | Antigravity |
|---|---|---|
| Standing rules, all projects | `~/.claude/CLAUDE.md` | Global rules |
| Standing rules, one project | `CLAUDE.md` in the folder | Workspace rules, or `AGENTS.md` in the project root |
| Permission handling | Permission modes, `Shift+Tab` | Autonomy presets |
| Review before acting | Plan mode | Planning mode |
| Watching work in progress | The session transcript | Agent Manager, `Cmd+E` |
| Extra capability | MCP servers | MCP servers |
| Packaged extensions | Plugins | No equivalent — copy files by hand |

## Module 2 in Antigravity

Antigravity uses autonomy presets rather than a permission mode cycle. Start on the review-driven preset, which is the closest equivalent to reviewing each action, then move up once the work is predictable.

The two facts that make Claude Code's auto mode dependable — an independent classifier on every action, and spoken limits being enforced — are specific to Claude Code. Do not describe Antigravity's presets as having them. Where the guarantee is absent, the substitute is planning mode plus a git checkpoint before anything substantial, which is module 5 doing more work than it otherwise would.

## Module 3 in Antigravity

Global rules cover everything; workspace rules cover one project. Install the contents of `templates/global-rules.md` as global rules.

`AGENTS.md` in a project root is read by most agent tools, including Antigravity. For a project that several different tools touch, `AGENTS.md` is the portable place for its rules.

Antigravity's memory behavior differs from Claude Code's and has no equivalent to `autoMemoryEnabled`. Check the current settings for what's available rather than assuming, and keep the standing rule in the rules file either way.

## Module 8 in Antigravity

MCP servers work the same way and the vetting and narrowing in `/first-agent:add-mcp` applies unchanged — the reasoning is about the server, not the client. Registration is through Antigravity's own MCP configuration instead of `claude mcp add`.

## The plugin itself

There's no plugin system to install into. Copy `templates/global-rules.md` into global rules, and use `antigravity/AGENTS.md` as the starting point for a project. The skills in `skills/` are written as instructions and can be pasted into a session when needed.
