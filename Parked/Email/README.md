# Parked (coenttb-ectomy 2026-07-12)

pf-html-era surface with no institute swift-html home yet: institute `HTML` is
the WHATWG_HTML namespace (single consolidated product), not the pf DSL protocol
(`struct X: HTML`, `some HTML`, `@HTMLBuilder`, `AnyHTML`, `HTMLPrinter`).

- `EmailDocument.swift`, `EmailMarkdown.swift` — rendering pipeline (also needs
  a Theme home: none exists; markdown candidate: swift-markdown-html-render
  "Markdown HTML Rendering").
- `BaseStyles.swift`, `Email+HTML.swift` — email CSS + `Email(html:)` DSL init.
- `EmailHTMLTests.swift`, `ReadmeVerificationTests.swift` — tests of the above.
- `AppleMail.swift` + `AppleMailTests.swift` — Apple Mail .eml surface; red against
  fresh-main RFC_5322 API drift (typed Header.Name subscript keys; init arg order
  date-before-subject; `.render()` → `String(message)`). Zero consumers in the app
  graph; repair is mechanical against the current RFC_5322 surface — bundle with
  the email wave.

Restore when the institute HTML-email story lands (open decision; see the
repotraffic ectomy charter close report 2026-07-12 + Workspace/BACKLOG.md).
