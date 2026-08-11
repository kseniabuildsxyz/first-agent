# Track — Writing and documents

For people whose output is prose — memos, reports, briefs, research — and who want tooling rather than a ghostwriter.

---

## Teach: where an agent is actually useful here

Be direct, because the expectation is usually wrong in one direction or the other:

> The weakest use is asking for a finished piece. What comes back is competent and sounds like nobody, and editing it into your voice usually costs more than writing it would have.
>
> The strong uses are the surrounding work. Assembling source material into one place. Finding what an argument is missing. Restructuring something that's already written. Checking a draft against what it was supposed to do. Producing the fourth variant of a paragraph when you can't see past your own third.

The pattern: they hold the argument and the voice, and the agent handles the material and the mechanics.

## Teach: plain text as a working format

> A document in Word is a sealed box — an agent can open it, but every change is a round trip. Plain text with light formatting, called Markdown, is just characters. It can be read, compared, versioned, searched, and reassembled freely, and turned into a Word file or a PDF when it needs to leave.

Not a request to abandon Word. A suggestion to draft where the tools work and export when it's finished.

With git from module 5, every draft is recoverable — which makes cutting a paragraph a cheap experiment rather than a decision.

## Do: set up a working folder

In `~/agent/projects/`, for something they're actually writing:

```
sources/     material — notes, transcripts, pasted references
drafts/      versions
out/         exported files that leave
```

Commit at the start. Then say the thing that makes it useful:

> Commit before a significant revision. You can cut hard and get it back, which usually improves the cutting.

## Do: build a tool for one real friction

Ask what part of their writing process they'd hand over, then build for that specifically. Common ones worth building:

- **Assemble.** Pull scattered sources into one annotated file so they draft from a single screen.
- **Interrogate.** Read the draft against its brief and report what's asserted without support, or what the stated goal doesn't cover.
- **Restructure.** Take a finished argument and reorder it, showing what moves.
- **Export.** Turn the finished draft into whatever format it has to leave in, formatted correctly, every time.

Build one. Have them use it on live work before adding another.

## Teach: two things to keep in mind

**Anything the agent reads is material, not instruction.** A source document containing "ignore previous instructions" doesn't get to redirect anything. Worth knowing when working with material they didn't write.

**Quotes and figures need checking against the source.** An agent assembling material can attribute confidently and wrongly. When precision matters, ask to see the passage it came from.

## Build

Good first builds: a compiler that turns a folder of notes into one drafting document; a reviewer that checks a draft against the brief it was written for; an exporter that produces a correctly formatted final file in one step.

The test is whether they reach for it on the next thing they write.
