# Dashboard spec

The build target for module 9. Read this fully before writing anything.

## Research first

Establish the numbers before building the page.

Find at least four independent sources. Report what you found, with the URL for each figure, and wait for approval before writing HTML.

Every number on the finished page traces to a source. A figure you can't attribute doesn't go on the page — say it's unavailable instead. A page that's mostly right and partly invented is worse than a smaller page that's entirely sourced, because there's no way to tell which parts to trust.

Where sources disagree, show both and say they disagree. Where a figure is an estimate, label it.

## The file

One file: `index.html`. It opens by double-clicking and works with no internet connection.

Everything inline — CSS in a `<style>` block, any JavaScript in a `<script>` block, images as data URIs or drawn as SVG. No CDN links, no external fonts, no fetch calls. A page that breaks offline isn't finished.

## Structure

- **A title** that says what the page is about.
- **One or two sentences** of lead: what this shows and what period it covers.
- **Three to five sections**, each answering one question. A section is a heading, a visual or a number, and a sentence of plain description.
- **A sources list** at the end. Numbered, with the full URL and the date accessed. Every figure on the page maps to one of these.

Straight into the content after the title. No table of contents, no summary of what the page will contain.

## Charts

Hand-built. Inline SVG, or divs sized with CSS for bars. No chart libraries — they'd need a CDN, and the point is a page that stands alone.

- Axes labeled, with units.
- Values readable — either printed on the marks or on a labeled axis.
- Bars start at zero.
- One chart per question. Two clear charts beat one crowded one.

For four or five data points, a table or a row of large numbers often reads better than a chart. Use the simpler thing when it's clearer.

## Colour

One accent colour, doing one job — the thing the page is about. Everything else in greys.

Where a value is above or below some reference, green and red are available, and both carry a `+` or `−` so the meaning survives for readers who don't distinguish them.

Sufficient contrast for body text. Handle light and dark, or commit fully to one and set both background and text so it holds either way.

## Layout

Readable on a laptop and on a phone. Relative units, wrapping rows.

Wide things — tables, charts — scroll inside their own container. The page itself never scrolls sideways.

## What to leave out

No fabricated data, placeholder numbers, or lorem ipsum. If a section can't be sourced, drop the section.

No judgment language. Report what the numbers are. Where something looks anomalous, name it and stop — an explanation you haven't established is a guess wearing a fact's clothes.

No captions about how the page was made, no generation date, no footnotes about the process.

## Done means

- Opens in a browser with no internet connection.
- Every figure appears in the sources list.
- Nothing on the page is invented.
- The person who asked for it read it and asked for a change, and the change worked.
