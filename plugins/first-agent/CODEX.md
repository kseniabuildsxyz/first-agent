# CODEX — the overlay for running this walkthrough in Codex

Read this only if you are Codex. START.md and the modules are written for Claude; this file lists what changes when you run them instead. Read START.md first, then this file, and re-read both before each module.

Where this file and a module disagree, this file wins. Anything it doesn't mention applies as written. Codex changes quickly, so START's rule holds here too: when this file and their screen disagree, the screen wins.

Don't mention Claude-only features to them, not even to say they don't apply. Teach what's true where they are.

## Swap these everywhere

| Modules say | In Codex |
|---|---|
| Claude, the Claude desktop app, the Code tab | Codex — in the ChatGPT desktop app, or the Codex CLI in a terminal |
| `~/.claude/CLAUDE.md` (standing rules) | `~/.codex/AGENTS.md` |
| A project's `CLAUDE.md` | That folder's `AGENTS.md` |
| `~/.claude/settings.json` | `~/.codex/config.toml` — TOML, not JSON |
| `/first-agent:<skill>`, e.g. `/first-agent:secrets` | `$<skill>`, e.g. `$secrets`, or pick it from `/skills` |
| `claude mcp add` | `codex mcp add` |
| `claude` (starting a session in a terminal) | `codex` |
| Session transcripts in `~/.claude/projects/` | Codex's own session records under `~/.codex/` — find the exact folder on their machine before naming it |
| Customize → Plugins / Skills / Connectors | Wherever their Codex shows plugins and MCP servers — look before naming a menu |

When you install `templates/global-rules.md`, install it to `~/.codex/AGENTS.md`, change every mention of `CLAUDE.md` inside it to `AGENTS.md`, and leave out its `## Memory` section.

## Module by module

**1 — Getting set up.** Ask whether they're in Codex in the ChatGPT desktop app or Codex in a terminal. To move to the `first-agent` folder: in the app, open the folder (⌘O or the project picker); in a terminal, quit, `cd ~/Desktop/first-agent`, and run `codex`. The connector preview becomes the plugins and MCP servers available to you in this session.

**2 — Permissions and modes.** Replace the auto mode teaching. Codex has no second reviewer model, so don't describe one. Teach its two controls instead: the **sandbox** decides what commands can touch (read-only, the workspace folder, or full access), and the **approval policy** decides when you stop and ask. The allowlist explanation still holds. The equivalent of skipping permissions is full access with approvals off. Have them read their current settings off the screen as written.

**3 — Instructions and memory.** Instructions arrive from four places, not five: drop memories from the list. Skip the memory teaching and the step that turns it off; Codex memory is off unless someone turns it on. Everything about context and compaction holds. When you show them the settings file, it's `~/.codex/config.toml`, and it holds the sandbox and approval settings, MCP servers, and hooks. `AGENTS.md` loading has a size limit (32 KiB by default), which is one more reason to keep the rules file short.

**4 — Terminal and Homebrew.** Unchanged, apart from how to open a terminal: use the one their Codex shows, or the Mac's Terminal app.

**5 — Installing things.** The tools install as written. For the plugin: Codex can read this repository's marketplace, and in the CLI plugins install with `/plugins`. If it won't install, follow the module's "If it doesn't install" section and keep reading the files over HTTPS. Describe whatever warning they actually see rather than the one the module names.

**6 — Keys and secrets.** Keychain teaching and the sweep are unchanged.

- **Deny rules.** Codex expresses these as filesystem `deny` entries in a permission profile in `config.toml`. Profiles are a newer feature and replace `sandbox_mode` rather than adding to it, so check that their version supports them before writing one, and translate `templates/deny-rules.json` into that form. If it isn't supported, say so plainly. The commit check and the Keychain still apply.
- **The commit check.** The plugin's hook may load, and Codex asks them to approve hooks with `/hooks`, so have them approve it. If it isn't loaded, copy `hooks/check-staged-secrets.sh` to `~/.codex/hooks/` and add a `PreToolUse` entry matching `Bash` to `~/.codex/hooks.json`, alongside any hooks already there.
- **Test it once**, whichever way it's wired. In a throwaway repository under `scratch`, stage a file containing `AKIA` followed by 16 capital letters or digits, then try to commit. The commit should be blocked. If it goes through, say the check isn't active in Codex rather than claiming it is.

**7 — Working habits.** Subagents exist in Codex; ask for them in plain language, as the module says. For compacting, clearing and new sessions, show them the commands in Codex's own `/` list and the new-thread button in the app.

**8 — Tools and connectors.** Built-in connectors become plugins and MCP servers. Narrow an MCP server with `enabled_tools` or `disabled_tools` on its entry in `config.toml` (you write it); narrow a plugin wherever their app's settings allow. In `$add-mcp`, use `codex mcp add`, and use `disabled_tools` where the skill says to add a deny rule.

**9 — Build something.** A fresh session is a new thread in the same folder, or `codex` in a new terminal tab. Session IDs work the same way for the transcript check.

**Close out.** Name the commands as `$scan-my-machine`, `$add-mcp`, `$secrets` and `$start`. Their rules live at `~/.codex/AGENTS.md`.
