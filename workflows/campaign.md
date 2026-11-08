# Run a refactoring campaign

Use when campaign mode was selected under [the entry point](../SKILL.md#choose-persistence).
Campaign mode is a persistence policy over the requested operation. It changes
how the agent discovers further work and establishes completion; it does not
expand edit permissions, scope, resource limits, or delegation authority.
An audit-only campaign inspects and records findings; a planning-only campaign
produces a plan. Repair still requires a cleanup/refactoring mandate.

## Establish coverage and the frontier

Record the selected operation, `mode: campaign`, repository identity, preserved
claims, requested scope/depth, and effective resource limits in the existing
[run record](../references/records.md#campaign-state). Use one file for a small
campaign; larger repositories may keep linked coverage and task tables.

Inventory the declared scope into coherent mathematical areas and relevant
module sets. Track which quality angles were examined, at what depth, on which
snapshot, and with what evidence. Distinguish an import inventory from a semantic
review and a full build. Cover high-impact interfaces and main-result dependency
chains early, then expand into uncovered areas. A representative pilot is a
starting point, not completion of a repository-wide campaign.

If the user specified a depth, retain it. Otherwise record the chosen depth and
its limits and continue expanding useful coverage within available resources.
Do not silently reduce a thorough-review request to a sample, or imply every
statement was checked when only selected chains were inspected. Excluded areas
must have an explicit scope reason; "not yet looked at" is a coverage gap.

Apply [individual theorem coverage](audit.md#theorem-coverage) to assumption
removal and Mathlib/local reuse within that scope. Track each inventoried
theorem's two review results, including private and unchanged declarations.
Representative chains may guide the order of work and the depth of other
angles; they do not replace these individual results unless the user requested
a sampled review. A resource limit leaves the uncovered portion explicit.

Keep a frontier of ready repairs, concrete investigations, and unreviewed areas.
A candidate finding needs investigation before speculative edits. Select the
next action by mathematical importance, confidence, dependencies, consumer value,
and cost, using [Planning](planning.md). An area can be reviewed with no defect;
coverage does not require changing its code.

## Repeat useful work

1. Inspect the next important gap or investigate a candidate, using [Audit](audit.md)
   and applicable rubrics. Record located findings and update the frontier.
2. For authorized repairs, plan a bounded coherent batch and follow
   [Repair](repair.md). Preserve definitions/claims and migrate consumers.
3. Apply [Verify](verify.md) and integrate the batch only with its required
   evidence. Unavailable preservation or integration checks stay pending.
4. Reinspect the changed boundary and relevant consumers for newly enabled reuse,
   missed duplicates, or affected assumptions. For example, an extracted fact
   may now replace repeated reasoning elsewhere. Revisit evidence invalidated
   by changed inputs; reuse unaffected checks.
5. Update coverage, finding dispositions, task priorities, and the next action.
   Continue while actionable work or meaningful coverage gaps remain within the
   mandate and available resources. When the backlog is empty, inspect uncovered
   areas or attempt closure rather than automatically finishing.

Maintain the theorem inventory and linked improvement records after each
integrated batch. New helpers need both reviews; migrations preserve identities,
and changed context reopens affected reviews. Totals describe verified changes
retained in the current candidate, not cumulative worker activity.

The discovery step is targeted, not a demand to reaudit the whole repository
after each small edit. No fixed number of sweeps or minimum change count is
required. Searches and reviews that find no issue are useful evidence. Repeating
the same unsuccessful search without new evidence is not progress.

Retain an accepted design unless a new consumer, defect, measurement, or source
comparison gives a concrete reason to revisit it. Do not cycle between equivalent
folder layouts, invent abstraction to create tasks, or remove useful interface
lemmas to keep editing. Every repair retains the ordinary preservation and
benefit requirements. Prefer investigation or unchanged code over unsupported
"improvement".

## Close against evidence

Before declaring completion, review the final candidate from the original
mandate and coverage record. Use a fresh reviewer when authorized and available;
otherwise make a separate closure pass and disclose that it is self-review.
The closure review asks:

- Has each in-scope area and relevant angle reached the recorded inspection
  depth, with no meaningful unreviewed or stale coverage hidden by sampling?
- Does [final theorem reconciliation](verify.md#reconcile-theorem-coverage)
  account for every current theorem and every baseline removal or migration in
  the declared review set, with current individual results for both checks?
  For a user-requested sample, reconcile that cohort and report the wider
  population separately; completing the sample does not claim full-library
  coverage.
- Are confirmed actionable findings addressed, with remaining candidates
  investigated or given an evidence-based disposition? A speculative preference
  can be withdrawn; deferring an actionable issue does not resolve it.
- Have all required preservation, trust, consumer, and integration checks passed
  for the actual final candidate, with migration notes current?
- Does a fresh search/review of the important boundaries identify further
  material work within scope? If so, put it on the frontier and continue.

Ground closure in final source and the declaration/API coverage evidence, not
only the completed plan or implementation summary. Refresh missing or stale
theorem reviews, including relevant unchanged code outside the initial findings,
then challenge important contract and dependency-replacement decisions. Check
retention reasons for duplicated proofs or unnecessary requirements. No new
finding is required; disclose authorized sampling and unreviewed scope instead
of inferring completeness from an empty backlog. Complete review coverage does
not itself resolve candidates or accept repairs, and closure does not require
zero judge flags or unrelated new mathematical development.

Complete only when closure supports these conditions. State the achieved scope
and depth and remaining uncertainty; this is not proof of a globally optimal
library. If material gaps, unresolved findings, or required checks remain, the
campaign is incomplete even if its accepted batches are individually sound.

## Checkpoint and resume

Honor user/host stops and resource limits; do not invent an unlimited allocation
or spend the remaining budget merely to extend runtime. Keep current state
durable after integrated batches and before foreseeable interruptions. Preserve
enough capacity for an honest check/handoff, leaving unfinished edits identified
rather than labeling them verified.

When a blocker affects one path, record it and continue independent work. When
no defensible action remains, or the runtime/budget ends, save the candidate,
coverage gaps, pending checks, reasons, and exact next action as an incomplete
checkpoint. Do not mark the campaign complete just to end the turn.

Use [Report](report.md) for a final report or user-facing checkpoint. Select a
useful explanation of the integrated work and coverage, with its numerical
summary of verified improvements and baseline/final scale measurements. Show
history only when recorded events support it, keeping unresolved work visible.

On continuation, load the current run state, verify snapshot and patch identity,
refresh affected stale evidence, and take the recorded next useful action. Keep
accepted units accepted unless new evidence reopens them. The host controls
automatic continuation and resumption; this Markdown workflow does not start
background processes, schedule jobs, or bypass a runtime limit.
