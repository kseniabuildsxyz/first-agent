# Module 10 — Your track, and your own work

Goal: they've done the track that matches their work, built one thing they'll actually use, and know what keeping it running involves.

Time: 20–30 minutes.

Module 9 taught the mechanics on a topic with no stakes. The only new thing here is that it's their real work, which means the output has to be right rather than interesting. Say that — it sets the standard for the build.

They can run this build in a second session the same way, coming back here when it snags. By now that should be their default rather than something you prompt.

---

## Do: pick the track

Read `~/.first-agent/PROFILE.md` and propose the track that fits. Don't ask them to choose from a list — say which one you think matches and why, and let them redirect.

| Track | For | File |
|---|---|---|
| Sheets | Spreadsheets as the system of record | `tracks/sheets.md` |
| Automation | Recurring work, handoffs between tools | `tracks/automation.md` |
| Writing | Documents, drafts, research | `tracks/writing.md` |

Run one. Offer the others later.

Record the choice in `PROFILE.md` under Track.

## Do: build the thing

Take the answer they gave in module 1 — the thing they do repeatedly and would rather not — and build it.

How to scope it. This is the part where the module earns its place, so hold the line on it:

- **One step of their real work, not a demo.** A toy example teaches them nothing they'll keep.
- **Small enough to finish today.** If it's a system, take the first slice and build that.
- **Reads before it writes.** Version one reports what it would do. Turning that into action is a small change once they trust the output.
- **Their data, their format.** The value is that it fits how they already work.

Build it with them watching, narrating what you're doing at the level of intent rather than syntax. Save a checkpoint before you start.

When it works, have them run it themselves, from the top, on real input. That's the moment the hour pays off — not you demonstrating, them using it.

## Teach: what keeping it running involves

Say this at the end, and don't soften it. It's the difference between someone who uses this in six months and someone who has an abandoned folder.

> This works now. It will break eventually, and knowing why in advance makes it a ten-minute fix instead of a dead end.

Three causes, concretely, with what changes:

- **The source moves.** A column gets renamed, a tab gets added, a report changes shape. The tool reads something that isn't there any more.
- **Access lapses.** A key gets rotated or a permission is revoked. It stops with an authentication error.
- **Your needs change.** The most common one. What you wanted in July isn't what you want in October.

Then the thing they should actually take away:

> None of that requires you to have become an engineer. It requires you to notice when the output looks wrong, and to bring the actual error to a session instead of working around it by hand. Whoever built it is whoever maintains it, and that's now you — which is the real trade for not having to wait on someone else to build it.

## Do: leave them a note

Write a short `README.md` next to what they built: what it does, how to run it, where its credentials live, and what to check first if the output looks wrong. Three or four lines. Written for them in three months, when the details are gone.

## Do: close out

Update `~/.first-agent/progress.md`:

```
Last module completed: 10
Next: complete
```

Then, briefly:

- What they set up, in one line — not a recap of ten modules.
- The commands they now have: `/first-agent:scan-my-machine`, `/first-agent:add-mcp`, `/first-agent:secrets`.
- That their rules live at `~/.claude/CLAUDE.md` and are theirs to change as they learn what they prefer.
- That asking a stuck session for its session ID and handing that to a second one is how they debug, since that's the technique they'll need soonest.
- The other two tracks, available whenever they want them.

Then stop. No summary of the journey.
