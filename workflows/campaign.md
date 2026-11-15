# Sustain repository work

Use automatically for whole-repository or broad multi-area requests under
[the scope instructions](../SKILL.md#work-to-the-requested-scope). Continue the
requested operation through discovery, coverage review, verified batches, and
closure. Keep edit permissions, mathematical scope, resource limits, and
delegation authority within the mandate. Audit-only work inspects and records
findings; planning-only work produces a plan. Repairs require a cleanup or
refactoring mandate. Focused tasks finish their named scope and affected consumers.

## Establish coverage and the frontier

Record the requested operation, repository identity, preserved
claims, requested scope/depth and measurements, and effective resource limits
in the existing [run record](../references/records.md#repository-progress). Use one
file for a small run; larger repositories may keep linked coverage and task tables.

Inventory the declared scope into coherent mathematical areas and relevant
module sets. Track which quality angles were examined, at what depth, on which
snapshot, and with what evidence. Distinguish an import inventory from a semantic
review and a full build. Cover high-impact interfaces and main-result dependency
chains early, then expand into uncovered areas. A representative pilot is a
starting point, not completion of the declared review scope.

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
- Has the requested operation been completed? An audit records located findings,
  candidates, and limits; a plan supplies evidence-backed tasks and acceptance
  conditions. Neither requires repairing the reported defects. For cleanup,
  confirmed actionable findings must be addressed and candidates investigated
  or given an evidence-based disposition. A speculative preference can be
  withdrawn; deferring an actionable repair does not resolve it.
- For implemented changes, have all required preservation, trust, consumer, and
  integration checks passed for the actual candidate, with migration notes current?
- Does a fresh search/review of the important boundaries identify further
  material work within scope? If so, put it on the frontier and continue.

Ground closure in final source and the declaration/API coverage evidence, not
only the completed plan or implementation summary. Refresh missing or stale
theorem reviews, including relevant unchanged code outside the initial findings,
then challenge important contract and dependency-replacement decisions. Check
retention reasons for duplicated proofs or unnecessary requirements. No new
finding is required; disclose authorized sampling and unreviewed scope instead
of inferring completeness from an empty backlog. Complete review coverage does
not itself resolve candidates or accept repairs. Apply the
[duplication review completion rules](inclusive-duplication.md#finish-the-duplication-review)
to reuse work. There is no implicit judge-score target; keep any requested
evaluation and its completion status explicit. A justified retained overlap
is not an unresolved maintenance defect. Do not invent unrelated mathematics
or delete a useful interface merely to improve a score.

Complete only when closure supports these conditions. State the achieved scope
and depth and remaining uncertainty; this is not proof of a globally optimal
library. Missing required coverage or unfinished deliverables keep the operation
incomplete. Open findings can be the result of a completed audit or plan; they
do not certify the library's condition. Unresolved actionable repair findings or
required acceptance checks keep cleanup incomplete even when individual batches
are sound.

## Checkpoint and resume

Honor user/host stops and resource limits; do not invent an unlimited allocation
or spend the remaining budget merely to extend runtime. Keep current state
durable after integrated batches and before foreseeable interruptions. Preserve
enough capacity for an honest check/handoff, leaving unfinished edits identified
rather than labeling them verified.

When a blocker affects one path, record it and continue independent work. When
no defensible action remains, or the runtime/budget ends, save the candidate,
coverage gaps, pending checks, reasons, and exact next action as an incomplete
checkpoint. Do not mark the requested work complete just to end the turn.

Use [Report](report.md) for a final report or user-facing checkpoint. Select a
useful explanation of the integrated work and coverage, with its numerical
summary of verified improvements and baseline/final scale measurements. Show
history only when recorded events support it, keeping unresolved work visible.

On continuation, load the current run state, verify snapshot and patch identity,
refresh affected stale evidence, and take the recorded next useful action. Keep
accepted units accepted unless new evidence reopens them. The host controls
automatic continuation and resumption; this Markdown workflow does not start
background processes, schedule jobs, or bypass a runtime limit.
