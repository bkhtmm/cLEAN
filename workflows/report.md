# Explain the result

Use this guide for user-facing audit, planning, repair, verification, and campaign
handoffs. Keep the operation's required evidence and acceptance conditions from
its workflow. Choose an explanation that fits the actual work, the reader's
needs, and the user's requested format.

## Choose what helps the reader

Lead with the consequential result and its practical meaning. A small repair
may need a paragraph, a migration table, and check results. A structural refactor
may benefit from a visual comparison and a concrete consumer example. An audit
can explain findings and coverage without proposing a new architecture.

Choose the order, length, and medium accordingly. There is no required report
layout, chart set, or minimum number of visuals. Similar work can reuse a good
explanation; different work should not be forced into the same presentation.
Use visuals when they make a material relationship or change easier to inspect.

The following are options, not required sections or claims about the target:

| Work or reader question | Possible explanation | Supporting evidence |
| --- | --- | --- |
| A small rename or API migration | A compact old-to-new table and updated use | Located declarations, migrated consumers, relevant checks |
| Duplicated reasoning replaced | A reuse map or a short explanation with a consumer example | Located replacement/extraction, contract comparison, migrated uses |
| A theorem generalized | Old/new signatures and an example application | Checked recovery of the original result and the generalized proof |
| Mathematical modules reorganized | Before-and-after module maps, grouped by mathematical role | Actual definitions, imports, consumers, and migration mapping |
| Main statements made easier to inspect | A comparison of definition modules and their import footprint | The same claims and a consistent dependency measurement |
| An audit or partially completed campaign | Findings and an area/angle coverage view | Recorded inspection depth, confidence, checks, and remaining gaps |
| A long campaign with useful recorded history | A milestone timeline or optional playback | Observed events, snapshots, and accepted/integrated task states |

## Answer the material questions

Make the following understandable where relevant, without using them as a fixed
set of headings:

- **Outcome and scope:** what was requested and delivered, for which snapshot
  and area. Distinguish completed work, proposals, and incomplete checkpoints.
- **Benefit:** what a reader or downstream consumer can now do more easily.
  Explain the mathematical or maintenance consequence of the change.
- **Preservation and verification:** what supports the retained claims and
  definition meanings, what checks passed, and what remains unchecked. A build,
  a semantic review, and a preservation proof establish different properties.
- **Use and migration:** where the relevant public mathematics now lives and
  how to use it, including breaking changes and old-to-new names when needed.
- **Remaining work:** material findings, coverage gaps, limitations, and the
  next useful action. A no-findings audit can be a useful completed result.

When a changed API or boundary is the main benefit, show a representative
consumer using the resulting public interface. Reuse an existing example where
possible; label a synthetic probe and its actual check status. An architectural
summary should let the reader find the relevant implementation and evidence.

Keep proposed organization and expected benefits visibly distinct from observed
improvements. An audit-only or planning-only report cannot claim repairs were
performed. A partially verified repair keeps its pending acceptance visible.

## Retain useful evidence early

At baseline or planning time, identify any comparison that would explain the
intended benefit and preserve the necessary inputs before edits. Use the existing
[run, task, finding, and check records](../references/records.md); reports are
views of that evidence, not a second task ledger or verification schema.

For selected measurements or graph extracts, record the source snapshot, scope,
method, units, relevant environment, and input/log location. Retain the baseline
and final values or extraction outputs needed to reproduce the comparison.
For migrations, retain mappings across moves, splits, merges, and replacements
when they matter to the explanation; filename similarity alone is insufficient.

Select evidence proportionately. Reuse valid checks and collect extra measures
only when they support a useful explanation within the run's resource limits.
If a baseline was not captured, recover it from a preserved snapshot when
practical, or state that the comparison is unavailable. Keep a useful qualitative
explanation when quantitative evidence is missing. Never invent measurements,
timestamps, consumers, or intermediate states to complete a visual story.

## Construct a fitting visual

The executing agent selects and constructs the visuals with available tools.
Mermaid, SVG, static plots, or local HTML can each fit; cLEAN requires no specific
renderer, external service, or installed visualization skill. Honor a requested
format. Keep a readable text or table explanation if rendering is unavailable.

Give each visual a clear question and a caption explaining the conclusion and
its limits. Prefer a meaningful boundary or selected dependency chain to an
unreadable whole-repository graph. Label schematic groupings as schematic;
identify sampled areas and omitted material.

For comparisons, keep the same claims, scope, category definitions, and counting
rules. Show meaningful categories and identities consistently across snapshots.
Distinguish files containing statement definitions from their import closure,
and file imports from declaration dependencies and refactor task dependencies.
Follow [verification](verify.md#verify-the-claimed-improvement) for comparable
dependency and performance measurements.

Make labels readable and pair color with text or other marks. Include a textual
explanation of the important result. Interaction can help inspect a selected
module or claim; timeline playback is useful only when actual history supports
it. Keep essential conclusions accessible without animation.

Avoid aggregate quality scores. Line counts, file counts, and task totals may
describe scale; a smaller number alone does not establish better mathematics or
a more useful library. Coverage displays should expose partial/unreviewed areas
and keep review depth separate from build and preservation status.

## Deliver and check the explanation

Give the user a concise summary with direct links to the changed mathematics,
report artifacts when useful, and supporting records. For extensive work, put
detail in a navigable report; for a small task, an inline answer may suffice.
Local HTML can provide an interactive report, with self-contained assets where
practical. Use the designated run/output location and preserve the user's chosen
delivery format. Report generation does not authorize hosting or publication.

Check that names, links, examples, displayed values, and status labels match the
actual final snapshot and records. Inspect rendered visuals for readability and
test any interactions used to communicate the result with available tools.
State an unperformed rendering check rather than implying it passed. Retain
editable visual sources and supporting data with substantial artifacts when
needed for review or reproduction.

Finish with the operation's real completion status. A polished report cannot
accept an unchecked task or close an incomplete campaign. On later real runs,
use reader confusion and observed reporting failures to refine this guide;
examples here are starting points, not a validated universal presentation.
