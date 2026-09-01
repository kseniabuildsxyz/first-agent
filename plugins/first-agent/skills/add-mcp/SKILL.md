---
description: Safely adopt an MCP server — check whether a built-in connector already covers it, vet the third-party option, narrow its permissions to what's needed, install it, and verify what it added. Use when someone wants to connect a new service or install an MCP server.
---

# Add an MCP server

Four steps in order: check for an alternative, vet, narrow, verify. Do not skip to install.

## 1. Check whether this is needed

Before evaluating a third-party server, establish what's already available:

- Is there a built-in connector for this service? Same capability, maintained, nothing to vet.
- Is there an official server from the company that runs the service?
- Does the task actually need a live connection, or would reading an exported file do?

If a built-in connector covers it, say so and stop. That's the finished answer.

## 2. Vet it

Gather and report:

| Check | What to establish |
|---|---|
| Origin | Who publishes it. A company, a known maintainer, or an anonymous account |
| Activity | Last commit, open issue count, whether issues get answered |
| Adoption | Stars, downloads, whether anyone else depends on it |
| Actions | The full list of tools it registers, read the source rather than the README |
| Reach | Which network hosts it contacts, and whether any are unrelated to the service |
| Credentials | What access it asks for, and whether the scope matches the actions |
| Install shape | A pinned version, or `latest` — and whether install runs arbitrary setup code |

Read the actual source for the action list and the network calls. A README describes intent; the code describes behavior.

Report as findings, then give a recommendation — adopt, adopt narrowed, or decline — with the reason in one line. One recommendation, not a menu.

Decline outright when: the action list doesn't match the described purpose, it contacts hosts unrelated to the service, it asks for access far beyond its actions, or it can't be pinned to a version.

## 3. Narrow it

The reason to narrow is not that a server is likely to be malicious. It's that an agent working quickly, holding write access to a live system, will eventually change something it shouldn't — not maliciously, just eagerly. That is the ordinary failure mode and it's what narrowing prevents.

So the question is never "is this safe?" but "does this need to write?" If reading covers the job, remove the writing. Payments, sends, deletions, and anything that alters a system of record are decisions for a person.

Assume the default configuration is broader than needed. Establish which actions the task actually requires, then reduce to those. Cheapest first.

**In the app, this is a click-through.** Open **Customize → Connectors**: **Discover** browses the directory, **Add** takes one of your own. If they can't find Customize, it's also reachable from the account menu at the bottom left → **Settings**, then **Customize** at the foot of the settings list.

Don't send them to **Settings → Desktop app → Extensions**. That panel installs `.mcpb` extensions for the Chat app and the Code tab doesn't see them.

The `claude mcp` commands below are the terminal equivalent and need the Claude Code CLI, which someone using only the app won't have. Prefer the interface.

**The interface, when there is one.** For a connector managed in account settings, the actions can be switched off by hand under Customize → Connectors. Prefer this over a config file when it's available — the user can see it, change it, and undo it without help.

**A setting the server already provides.** Many offer a read-only mode or a tool allowlist through an environment variable. Check the source for one before doing more work.

```bash
# terminal (needs the CLI); in the app, set the same variable
# on the server's entry under Customize → Connectors
claude mcp add <name> -s user -e SERVER_READ_ONLY=true -- <command>
```

**Deny rules on the tools.** Works regardless of what the server offers. Add to `permissions.deny` in `~/.claude/settings.json`:

```json
{ "permissions": { "deny": ["mcp__<server>__<destructive_tool>"] } }
```

**Your own copy.** When the server offers no switch and the tool list needs real surgery: clone it, remove the tool registrations you don't want, run that copy by absolute path. More work, and the only approach where the capability can't widen without you.

```bash
git clone <repo> ~/Desktop/agent/projects/<name>
# remove unwanted tool registrations, then register the local copy:
# terminal —
claude mcp add <name> -s user -- /absolute/path/to/server
# in the app — Customize → Connectors → Add, pointed at the absolute path
```

For a first install of anything, narrow to read-only. Writes get enabled later, deliberately, for a named purpose.

## 4. Verify

- List the tools it registered. Confirm the list matches what was expected after narrowing, and that nothing removed is still present.
- Call one read-only tool against something real.
- Confirm any tool that was supposed to be gone actually fails.

Report the final action list to the user. They should end knowing exactly what was added.

## Record it

Append to `~/.first-agent/mcp-log.md`: the server, version or commit installed, **what it is for and when to reach for it**, what it was narrowed to, what was deliberately left alone, and the date.

This file is a register agents read before starting work, not an archive. Two jobs:

- **What changed.** An update can add tools and ask for broader access than the version you checked. Without a record there's nothing to compare against.
- **What exists.** An agent that doesn't know a purpose-built server is installed will reach for a general-purpose tool, fail slowly, and report the task as impossible. Writing down what each server is *for* is what prevents that, so favour a plain sentence about the job it does over a list of tool names.

Note anything the user has decided **not** to use, and why, in the same file.

## Enumerating what's already there

Before any of the above, establish what the user already has. Don't rely on a single listing tool — a connector listing can come back empty while connectors are live. Read the tools actually available in the session and report that. Where the two disagree, say so and trust what you can see.

For each connector, report the action count and **how many of those actions change something**. That second number is the one that matters and the one nobody looks at.

$ARGUMENTS
