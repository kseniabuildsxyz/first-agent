# Module 8 — Tools and connectors

Goal: they know what they already have connected, they understand the three places extra capability comes from, and they've narrowed at least one thing themselves.

Time: about 20 minutes.

Before starting, re-read START.md — in particular "How to read a module."

Start with what's already in their account. An MCP install is a fallback for a gap, not the destination.

---

## Open

> This module is about reaching the tools your work lives in: your email, your documents, and whatever else you use every day. Some of it may already be available without your having set anything up. Nothing gets installed unless you decide you need it, and it takes about twenty minutes.

## Teach: connectors that come with the account

> On their own, agents can read and write files in the folder they're working in and search the web, but not open your email or your documents. A **connector** closes that gap. It's a link between an agent and one of your services, and it supplies a specific set of tools, like searching your inbox or reading a document.
>
> The connectors built into your Claude account are the simplest kind. They're built either by Anthropic or by the company whose service it is, they're switched on in your account settings, and nothing gets installed on your computer. They also follow your account, so a connector you set up in the desktop app is available in the terminal version too, on the same login.

They're managed under **Customize → Connectors** — **Discover** to browse the directory, **Add** for one of your own. Customize also holds Skills and Plugins, so it's the same place they installed this walkthrough in module 5. If they can't find it, it's reachable from the account menu at the bottom left → **Settings**, then **Customize** at the foot of the list.

One thing not to confuse it with: **Settings → Desktop app → Extensions** is a different panel that installs extensions for the Chat app. The Code tab doesn't see those.

## Do: show them what they already have

Enumerate honestly. Don't rely on a single listing tool — the connector list can come back empty even when connectors are live. Read what's actually available to you in this session and report that. If the two disagree, say so and trust what you can see.

> For each connector, there are two numbers worth knowing: how many actions it gives an agent, and how many of those change something instead of only reading. The second number is the one to pay attention to, because an action that changes something is the kind a mistake can do damage with.

Then give one concrete example against something of theirs — a document that exists, a real thread — so it isn't abstract. Keep it to one. Don't tour everything you can do, and don't stage a demonstration of something being refused.

## Teach: where the gaps are

> Only the largest services have a built-in connector, and even those don't always offer everything you'd want. When there's a gap, the next option is an **MCP server**. MCP stands for Model Context Protocol, a shared standard for connecting agents to tools, and an MCP server is a program that uses that standard to supply actions against a particular service.
>
> Some MCP servers are hosted by the company that runs the service. Others are small programs that run on your own computer, and those need two things kept in mind. They run with your access, so they aren't walled off from your files. And they need your credentials to reach the service, which means they act as you: anything one of them can do, it does under your name.
>
> There's an order to try things in, cheapest and safest first. A built-in connector comes first, since there's nothing to install. Next is an official MCP server from the company whose service it is, because their name and reputation are on it. Last is a community server, which is someone's independent project. That's sometimes the only option, and it's the one that needs checking before it goes on your machine.

If they need something in the second or third category, they can look it up when they get there. There's no reason to install one today for the sake of it.

## Teach: narrowing, and what it's actually for

This is the part that goes unused, and the reason usually given for it is the wrong one.

> The usual worry about connecting an agent to your systems is that something malicious will hijack it. The more likely problem is more ordinary: an agent working quickly, with permission to change a live system, will eventually change something it shouldn't. It won't be malicious, only too eager, and narrowing is what prevents it.
>
> So for any connection, the useful question is whether it needs to change anything at all. If reading covers the job, switch off the actions that write, send or delete, and then a mistake has nothing it can break.
>
> Take an expense and card platform like Ramp. Its own MCP server is well built, and it exposes a lot: reading every card transaction, reading every bill, and also making payments. For almost anything you'd ask an agent to do there, reading is the whole job, and a payment is a decision a person should make. So the sensible setup is to switch it down to the reading actions, instead of accepting the full set because that's what the company shipped. The same goes for anything that holds your numbers: reading a system of record is useful, and changing one should be your decision.

## Do: narrow something, in the interface

Have them do this themselves, in **Customize → Connectors**, on a connector they actually have. This is the one place in the walkthrough where they change a setting by hand, and that's deliberate: switching a permission off in the interface teaches them the environment is theirs to configure. A deny rule written into a settings file does the same job and teaches them nothing they'll reuse.

> Let's narrow one of yours. Open Customize, then Connectors, and pick one you actually use. Read through its list of actions and switch off anything that sends, deletes or pays for something. Then look at what's left, because that's everything an agent can now do there.

Where the interface can't express what's needed, reach for the alternatives in this order: a read-only switch the server already offers, a deny rule in `~/.claude/settings.json` (which you write), or their own copy of the server with the unwanted actions removed. The last is more work, and it's the only one where the capability can't widen without them.

## Teach: checking something before installing it

For anything in the second or third category, there's a check to run first, and `/first-agent:add-mcp` runs it: who publishes it, whether it's maintained, the full list of actions read from the source rather than the README, which network hosts it contacts, what access it asks for, and whether it can be pinned to a version.

Point back to module 5:

> When we added the plugin marketplace in module 5, the red warning said Anthropic doesn't control what's in a plugin and can't promise it won't change. The same is true of MCP servers, and of anything else you install that someone else wrote. That doesn't mean avoiding them. It means knowing whose it is, looking at what it can do before it goes on your machine, and keeping a record of what you installed.

## Do: write down what's connected

Record it in `~/.first-agent/mcp-log.md` and explain what the file is for, because otherwise it gets written and never explained:

> I'm keeping a register at `~/.first-agent/mcp-log.md` of everything on this machine an agent can reach that isn't in your connector list: what each one is for, and what we switched off. Your standing rules tell agents to read it before starting work.
>
> It does two jobs. The first is telling you what changed: an update can add actions or ask for broader access than the version you looked at, and without a record there's nothing to compare against. The second is telling agents what exists. Without it, an agent reaches for a general-purpose tool, fails slowly, and tells you a task is impossible when the right server was installed all along.

Note anything **not** to use here too, and why.

Note anything left undone and why. If a connector still has change-capable actions you didn't touch because you don't know which ones they use, say that and log it as outstanding rather than guessing.

## Holding the objective

What they should be able to do afterwards: say what's connected and how many of its actions change something, find where to switch actions off, and know the order to try when something they need isn't connected.

If they push further, these are true and worth having ready:

- **"Can a connector see everything in my account?"** It can do whatever its actions allow, with their account's access. Narrowing limits which actions exist; it doesn't limit which files or messages a reading action can see.
- **"Where does data I read through a connector go?"** Into this conversation, where it's handled like anything else they type. For anything about retention, point them to their plan's data settings rather than making claims you can't check.
- **"What if I switch off something I needed?"** Switch it back on. When a task needs an action that's been switched off, say so instead of quietly working around it.
- **"Is a community MCP server ever fine?"** Yes, once it passes the add-mcp check: a known publisher, active maintenance, actions read from the source, and narrowed to what the job needs.

## Checkpoint

Update `~/.first-agent/progress.md`:

```
Last module completed: 8
Next: 9 (optional)
```

Then be clear about where they've got to. Say this only if it's true — if the plugin didn't install, a step was skipped, or something was logged as outstanding, say what's outstanding instead:

> That's the setup finished. Your machine is configured, your keys have somewhere safe to live, your work folder has version history, and you know what I can reach and how to change it.

Module 9 is optional, and it's a build of their own choosing. Describe it in two lines and let them decide whether they want it now, later, or not at all. Stopping here is a complete outcome.
