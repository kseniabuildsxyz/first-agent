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

Assume the default configuration is broader than needed. Establish which actions the task actually requires, then reduce to those. Cheapest first:

**A setting the server already provides.** Many offer a read-only mode or a tool allowlist through an environment variable. Check the source for one before doing more work.

```bash
claude mcp add <name> -s user -e SERVER_READ_ONLY=true -- <command>
```

**Deny rules on the tools.** Works regardless of what the server offers. Add to `permissions.deny` in `~/.claude/settings.json`:

```json
{ "permissions": { "deny": ["mcp__<server>__<destructive_tool>"] } }
```

**Your own copy.** When the server offers no switch and the tool list needs real surgery: clone it, remove the tool registrations you don't want, run that copy by absolute path. More work, and the only approach where the capability can't widen without you.

```bash
git clone <repo> ~/agent/projects/<name>
# remove unwanted tool registrations, then register the local copy
claude mcp add <name> -s user -- /absolute/path/to/server
```

For a first install of anything, narrow to read-only. Writes get enabled later, deliberately, for a named purpose.

## 4. Verify

- List the tools it registered. Confirm the list matches what was expected after narrowing, and that nothing removed is still present.
- Call one read-only tool against something real.
- Confirm any tool that was supposed to be gone actually fails.

Report the final action list to the user. They should end knowing exactly what was added.

## Record it

Append to `~/.first-agent/mcp-log.md`: the server, version or commit installed, what it was narrowed to, and the date. This is what makes re-checking possible after an update.

Tell them what to do when it updates: an update can add tools and widen scopes, so the action list is worth re-listing after one. Their own copy only changes when they change it.

$ARGUMENTS
