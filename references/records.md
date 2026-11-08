# Run records

Use these fields as a handoff contract, not a requirement for a database or one
file per entry. Markdown tables, prose records, or equivalent structured data
are fine. Store logs and probes alongside the run; link them rather than copying
large output. Use repository-relative paths in records so they travel with the
work. Keep credentials and unrelated personal data out of reports.

Keep a clearly identified current state summary. Label earlier plans and
checkpoints as history so a resumed worker does not mistake an old `in_progress`
entry for the final accepted state.

## Run

- **Identity:** target path, base revision or snapshot, relevant uncommitted
  changes, current candidate revision or patch identity, and run directory.
- **Skill identity:** cLEAN revision and relevant local changes when available,
  or content hashes of the instruction files used. The version label alone may
  not distinguish changing drafts. Record the executing model when available.
- **Mandate:** requested operation (audit, plan, refactor, or verify), persistence
  mode (`bounded` or `campaign`), scope and review depth/exclusions, main claims,
  effective compatibility and axiom policies, pinned Lean/dependency versions,
  and resource limits.
- **Evidence:** baseline commands and failures, preserved specification location,
  mathematical sources, coverage by module and angle, and unperformed checks.
  Keep the [theorem review](#theorem-review) inventory and individual outcomes;
  broader area/API summaries supplement rather than replace them.
- **Measurements:** baseline/final values using the [counting rules](#measurements),
  with scope, snapshot, method, exclusions, and source/check links. Link verified
  improvements and report locations. Extra graph extracts and observed event
  times are useful when they support the explanation.
- **Organization:** mathematical map, proposed module boundaries, important
  interfaces, task dependency order, and current integration point.
- **Progress:** accepted work, active/ready tasks, unresolved decisions, remaining
  scope, migration map, and the next useful action.

If Git is absent, use a copied snapshot and file hashes. A timestamp alone is
insufficient to identify the source that a successful check validated.

## Theorem review

Keep one inventory of project-owned, source-authored theorem/lemma declarations
within the declared review scope, including private and unchanged declarations.
Identify dependency, generated, vendored, or other excluded material explicitly.
Record the census method, input snapshot, and completeness limitations. Retain
baseline and final inventories and the result of reconciling them with reviews.

Each declaration needs:

- **Identity:** stable run ID, original and current qualified names/source
  locations, and baseline/current signatures or links to them. Preserve the ID
  across moves and renames. Map splits, merges, replacements, and removals;
  assign new IDs to newly introduced helpers rather than losing their coverage.
- **Assumption review:** coverage (`unreviewed`, `reviewed`, or `stale`), outcome,
  rationale, and evidence about the inspected requirements. Distinguish complete
  deletion from weakening; link findings, justified retentions, and checked
  weaker signatures where applicable.
- **Reuse review:** the same separate coverage/outcome/evidence fields, including
  located Mathlib/local candidates, dependency search boundary, contract fit,
  adapter checks, and any reason to retain the public interface.
- **Validity:** reviewed snapshot, relevant definition/instance/dependency
  context, reviewer or task, and why prior evidence remains valid if reused.
  Reopen affected checks when their inputs or available replacement APIs change;
  unchanged theorem text alone does not establish validity.

Outcomes distinguish no justified issue found, a candidate or unresolved question,
a confirmed issue, and justified retention. An inspected candidate can count as
reviewed while its investigation remains open; it is not a verified improvement.
An unavailable substantive review remains unreviewed with a reason. Shared
context and search logs may be linked from several rows, but every declaration
needs its own two outcomes. No per-binder inventory is required for declarations
where no removal is proposed.

Full coverage requires a complete census and current individual review evidence
for both checks on every surviving declaration. Account for baseline removals
through explicit disposition/migration records. Missing or stale rows are gaps;
excluded or removed declarations must not silently disappear from the record.
Record the actual reconciliation procedure and result. These Markdown fields
do not themselves run a census or verify the quality of an AI judgment.

## Verified improvement

Record each implemented improvement once, linked to its finding/task and checks:

- **Identity/type:** improvement ID, baseline declaration IDs or module paths,
  final counterparts, and category (assumption removal, Mathlib reuse, local
  reuse, or structural change).
- **Before/after:** old/new signatures and the exact deleted requirements; or
  independent implementation and located replacement/adapter; or explicit
  move, rename, split, or merge mapping. Keep a useful retained wrapper visible.
- **Evidence/state:** preservation, proof/consumer/integration checks, final
  snapshot, task disposition, and measured units contributed to the summary.

Only net improvements retained in the checked, integrated final candidate
contribute to completed-repair totals. Proposed, unverified, reverted, or
superseded edits remain distinguishable. Deduplicate workers and repeated edits
through the same baseline identities; a split or merge must not multiply credit.
Audit/plan runs report findings and coverage with zero integrated repairs.

## Measurements

Use the same counting rules and project-owned scope before and after, including
corresponding destinations of moved files. Record the actual included file sets,
filters, snapshots, method, and units. Capture the baseline before editing or
recover it from the preserved snapshot; mark unavailable values as unavailable,
not zero. A checkpoint identifies its current candidate rather than a fictitious
final result.

| Measure | Counting rule |
| --- | --- |
| Theorem coverage | Baseline/final census sizes, additions/removals, and current reviewed/total counts separately for assumptions and reuse; expose stale and unreviewed counts and census limitations. |
| Assumptions removed | Count original requirement occurrences wholly removed from surviving or recovered original claims, plus distinct baseline theorems affected. Weakening/replacing a requirement or deleting its whole theorem does not count. Verify combined removals and original-claim recovery. |
| Dependency reuse | Count distinct theorem sites with candidates, verified adapters, and integrated replacements separately. Separate Mathlib from local reuse; distinguish redundant declarations removed from useful interfaces retained with delegated proofs. Record unresolved and withdrawn candidates. |
| Remaining findings | Separate confirmed open issues from unverified candidates, deferred issues, and justified retentions; do not infer zero defects from an empty or partial review. |
| Lean lines/files/directories | Physical lines, including blank/comment lines; counted `.lean` files; and distinct directories directly containing those files. State the line-count method and root handling. Exclude dependencies, `.lake`, generated/vendor material, probes, and run/report artifacts. Show baseline, final, and delta. |
| Reorganization | Count mapped file/declaration moves and renames, with splits and merges reported as separate events. Give entity type and mappings; added/deleted file totals alone do not establish a move. Report new helper declarations separately. |

Do not turn code size or organization counts into quality scores. Other
measurements, such as import footprint or build cost, remain task-dependent and
need comparable inputs. The verified-edit totals establish completed work;
they do not establish a change in benchmark flag rates. An optional before/after
judge evaluation records its model/protocol, pass count, sampling, and denominator;
compare matched theorem cohorts and show additions/removals separately. Keep
judge flags separate from Lean-verified findings and repairs.

## Campaign state

For [campaign mode](../workflows/campaign.md), extend the same run record; no
separate configuration file or database is required. Keep:

- **Coverage:** mathematical areas and their module sets; relevant quality
  angles, intended inspection depth, inspected snapshot, evidence, and remaining
  gaps. Distinguish inventory, semantic inspection, and build coverage. Mark
  areas/angles unreviewed, reviewed, needing recheck, or blocked as appropriate.
- **Frontier:** current batch, ready investigations/repairs, unreviewed area to
  inspect next, and outstanding integration or verification work.
- **Discovery decisions:** new findings, changed priorities, and why a candidate
  was accepted, withdrawn, blocked, or left outside scope. Rejected alternatives
  need enough evidence to prevent repeated exploration, not a full transcript.
- **Checkpoint:** candidate identity, preserved specification, accepted patches,
  pending checks, safe state of unfinished edits, resource limits, and exact next
  action. Keep the selected mode and operation visible after context loss.
- **Closure:** review snapshot, coverage/depth actually reached, reviewer and
  evidence, unresolved findings, and whether the campaign is complete at that
  depth or remains incomplete because of gaps, checks, blockers, or resources.

## Finding

- **ID/category/location:** stable ID such as `F-012`, angle(s), declarations,
  paths and useful lines at the inspected snapshot.
- **Observation/consequence:** the defect or uncertainty and the mathematical or
  consumer task it obstructs.
- **Evidence/confidence:** located source, signature, use, replacement, or
  diagnostic; `confirmed`, `candidate`, or `unresolved`.
- **Consumers/search boundary:** known uses, attributes and automation roles,
  and what was searched or remains unknown.
- **Direction/benefit:** bounded repair or investigation and the demonstrable
  improvement expected.
- **Acceptance/constraints:** necessary preservation, build, consumer, and review
  evidence; prerequisites, compatibility effects, cost, and uncertainty.
- **Disposition:** open, addressed by a linked task and check, deferred with a
  reason, or withdrawn with contrary evidence.

Confidence describes the finding. It does not say whether its fix was tested.

## Task

- **ID/goal:** stable ID such as `T-004`, linked findings, desired outcome, and
  kind: investigation, refactor, or separately scoped mathematical correction.
- **Base/scope/owner:** input snapshot, permitted files/declarations to edit,
  affected consumers, assigned worker if any, and worktree or patch location.
- **Dependencies/interface:** prerequisite IDs, agreed signatures and import
  direction, shared resources, and outputs consumed by later work.
- **Transformation/preservation:** intended change, claims to retain, required
  bridge or statement check, and old-to-new names/modules.
- **Acceptance:** explicit checks, relevant review angles, and an observable
  quality improvement. Distinguish required checks from optional measurements.
- **Cost/limits:** expected affected rebuild scope, measurements or estimates,
  resource limits, and a stop/replan condition.
- **State/evidence:** state below, reason, patch identity, linked check results,
  reviewer outcome, and remaining concerns.

Task states:

`ready → claimed → in_progress → review → accepted → integrated`

Use `needs_investigation` or `blocked` with a concrete missing prerequisite;
`deferred` when outside the current scope/budget. A reviewer can return a task to
`in_progress`. Single-agent runs may collapse claimed and in-progress. An
accepted patch passed its task checks; integrated means the combined candidate
passed its integration checks. Neither means the entire campaign is complete.

## Check

- **Identity/property:** check ID, task(s), and the property being assessed:
  build, assumptions, specification preservation, migration, or quality.
- **Inputs:** exact snapshot/patch, working directory, toolchain, relevant
  dependency and configuration identity, build target or declarations covered.
- **Method:** command or review procedure, selected scope, and log/probe location.
- **Outcome:** `pass`, `fail`, `unavailable`, or `not_run`; exit status or review
  evidence, important diagnostics, pre-existing versus new failures.
- **Limits:** excluded targets, uninspected definitions, uncertain assumptions,
  or resource limitations. A check that timed out has not passed.

## Handoff and completion

A worker returns the task ID, base and patch, modified files and APIs, migration
map, checks and their exact inputs, observed improvement, and remaining issues.
The coordinator records the integration result separately.

A final report states what was requested, delivered, checked, and left open;
links changes and evidence; identifies breaking changes; and gives the next
useful action for deferred work. Report audit/plan/repair completion separately
from whether the scoped repository has passed all required verification.

Use [Report](../workflows/report.md) to select the user-facing explanation and
visuals from these records. Keep the records authoritative as reports are revised.
