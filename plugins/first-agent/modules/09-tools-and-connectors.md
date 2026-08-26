# Module 9 — Tools and connectors

Goal: they know what they already have connected, they understand the three places extra capability comes from, and they've narrowed at least one thing themselves.

Time: about 15 minutes.

Start with what's already in their account. An MCP install is a fallback for a gap, not the destination.

---

## Open

Two lines: this is about reaching their actual tools — email, documents, whatever their work lives in. Some of it is already available and they may not know.

## Teach: connectors that come with the account

> On my own I can read and write files here and search the web. I can't open your email or your documents. A **connector** closes that gap: it's a link between me and one of your services, giving me a specific set of actions.
>
> The ones built into your Claude account are the easiest kind. They're maintained by the company that runs the service, they're switched on in your account settings, and there's nothing to install or vet. They also follow your account — set one up here and it's there in the terminal version too, on the same login.

They're managed under **Settings → Connectors**, in the same place as Plugins from module 5.

## Do: show them what they already have

Enumerate honestly. Don't rely on a single listing tool — the connector list can come back empty even when connectors are live. Read what's actually available to you in this session and report that instead. If the two disagree, say so and trust what you can see.

For each connector, give them the numbers that matter: how many actions it has, and **how many of those change something** rather than just read. That second number is the one worth their attention and it's the one nobody looks at.

Then a concrete example against something of theirs — a document that exists, a real thread — so it isn't abstract. Keep it to one. Don't perform a tour of everything you can do, and don't stage a demonstration of something being refused; they've used Claude before and know it can reach tools.

## Teach: where the gaps are

> Only the largest services get a built-in connector, and even those don't always expose everything you'd want. When there's a gap, the next option is an **MCP server** — a small program that runs on your computer and gives me actions against a service that has no built-in connector.
>
> Two things to hold onto. It runs on your machine with your access, so it isn't sandboxed away from your files. And it needs your credentials, which means it acts as you — anything it can do, it does under your name.

The order to try, cheapest and safest first:

1. **A built-in connector.** Nothing to vet.
2. **An official MCP server from the company whose service it is.** Their name is on it.
3. **A community server.** Someone's side project. Sometimes the only option, and the one that needs work before it goes on your machine.

If they need something in category 2 or 3, they can look it up when they get there. There's no reason to install one today for the sake of it.

## Teach: narrowing, and what it's actually for

This is the part that goes unused, and the reason usually given for it is the wrong one.

> The risk worth planning for isn't that something malicious hijacks a tool. It's that I do something careless with one. An agent working quickly, given write access to a live system, will eventually change something it shouldn't — not maliciously, just eagerly. That's the ordinary failure and it's the one narrowing prevents.

Then the rule that follows:

> So the question for any connection isn't "is this safe?" It's "does this need to write?" If reading covers the job, take the writing away. Then a mistake has nothing to work with.

Use a real example, since it makes the principle concrete:

> Take an expense and card platform like Ramp. Its own MCP server is well built and it exposes a lot: read every card transaction, read every bill — and also make payments. For almost anything an operator wants, reading is the whole job. Payments are not an agent's decision. So the sensible move is to strip it back to the read actions and run that, rather than accepting the full set because the vendor shipped it.
>
> Same logic for anything holding your numbers. Reading a system of record is useful. Writing to one is a decision a person should make.

## Do: narrow something, in the interface

Have them do this themselves, in the settings UI, on a connector they actually have.

This matters more than it looks. A deny rule buried in a JSON file teaches them nothing they'll reuse — they'll never open that file again. Clicking a permission off in **Settings → Connectors** teaches them that the environment is theirs to configure, which is the thing they'll actually carry forward.

Walk them to it, let them read the list of actions, and have them turn off something that shouldn't be automatic — anything that sends, deletes, or pays. Have them look at what's left.

Where the interface can't express what's needed, then reach for the alternatives, in this order: a read-only switch the server already offers, a deny rule in `~/.claude/settings.json`, or their own copy of the server with the unwanted actions removed. The last is more work and the only one where the capability can't widen without them.

## Teach: checking something before installing it

For anything in category 2 or 3, there's a check to run first, and `/first-agent:add-mcp` runs it: who publishes it, whether it's maintained, the full list of actions read from the source rather than the README, which network hosts it contacts, what access it asks for, and whether it can be pinned to a version.

Point back to module 5:

> That red warning when we added the plugin marketplace said Anthropic doesn't control what's in a plugin and can't promise it won't change. That's true of MCP servers too, and it's the honest situation for anything you install. It isn't a reason to avoid them. It's the reason to know whose it is, to look at what it can do, and to keep a record.

## Do: write down what's connected

Record it in `~/.first-agent/mcp-log.md` and tell them what the file is for, because it gets written and never explained:

> This is a list of what's connected, what it can do, and what we turned off — with today's date on it. The reason it exists is that these change. An update can add actions and ask for broader access than the version you looked at, and without a record there's nothing to compare against. When something updates, this is what makes "what's new here?" a five-minute question instead of a fresh audit.

Note anything left undone and why. If a connector still has change-capable actions you didn't touch because you don't know which ones they use, say that and log it as outstanding rather than guessing.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 9
Next: 10 (optional)
```

Then be clear about where they've got to:

> That's the setup finished. Your machine is configured, your keys have somewhere to live, your work folder has a history, and you know what I can reach and how to change it. Nothing is outstanding.

Module 10 is optional and it's a build of their own choosing. Describe it in two lines and let them decide whether they want it now, later, or not at all. Stopping here is a complete outcome, not an abandonment.
