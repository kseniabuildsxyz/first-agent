# Track — Spreadsheets

For people whose numbers live in Google Sheets or Excel and who want an agent working on the live thing.

---

## Teach: the distinction that matters

This is the one thing people in this track get wrong, and it costs them weeks:

> There are two ways an agent can work with your spreadsheet, and they behave completely differently.
>
> **A copy.** The file gets downloaded, changed, and handed back. The numbers are right, but formulas become values, formatting goes, and anyone else editing at the same time has their work overwritten. Fine for analysis, wrong for a shared model.
>
> **The live sheet.** The agent reads and writes the actual document through the service's own interface. Formulas stay formulas, other people keep working, and a change appears the way any change does.

For anything that's a system of record, they want the second. It takes more setup, which is why the first is so often used by mistake.

## Teach: what Sheets needs

> Google Sheets doesn't have a built-in connection for this the way some services do. It needs a small program in between, and getting one authorized involves Google's own setup process. It's the most involved thing in this whole walkthrough — perhaps twenty minutes — and it's a one-time cost.

Say the twenty minutes out loud before starting. It's a fine cost when expected.

## Do: set it up

Walk them through, pausing where they act:

1. **A Google Cloud project.** Free, and just a container so Google knows which app is asking. Name it something they'll recognise in a year.
2. **Turn on the Sheets and Drive interfaces.** Two switches in that project.
3. **Create credentials** for a desktop application. This produces a file — the thing that proves the program is allowed to ask.
4. **Store it properly.** Not in Downloads. Into the Keychain or a deliberate location, per module 6, and never inside a folder with history.
5. **Sign in.** A browser page opens and they approve the access. **They sign in — you never enter their credentials.**
6. **Register it read-only.** First install reads and nothing else.

Google's console changes its wording periodically. Read what's actually on their screen rather than reciting steps from memory, and if a label doesn't match, say so and look.

## Do: prove it works

On a sheet they can afford to break — have them duplicate a real one:

- List the tabs. They see their own tab names come back.
- Read a range and show the values.
- Read the same range showing formulas rather than results, so they see the difference between what a cell contains and what it displays.

That last one is what makes the live-versus-copy distinction concrete.

## Teach: what to watch for

- **A permission error on one sheet** means that document hasn't been shared with the account they authorized. It isn't a broken setup. Share it and retry.
- **Read-only is the right default.** When they eventually want writes, turn them on deliberately, for one purpose, and have the agent show the target range and the values before it writes.
- **Never write to a live model as a side effect** of another task. It goes in their standing rules if it isn't there already.

## Build

Something that reads and reports. Not writes.

Good first builds: a weekly summary pulled from tabs they'd otherwise open by hand; a check that flags rows where two sheets disagree; a monthly figure assembled from three places.

The pattern is that it reads what they'd have read and tells them what they'd have worked out. Writing comes later, once they've watched it be right a few times.
