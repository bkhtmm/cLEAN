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
- **Mandate:** requested operation (audit, plan, refactor, or verify), persistence
  mode (`bounded` or `campaign`), scope, main claims, effective compatibility and
  axiom policies, pinned Lean/dependency versions, and resource limits.
- **Evidence:** baseline commands and failures, preserved specification location,
  mathematical sources, coverage by module and angle, and unperformed checks.
- **Presentation evidence (when useful):** baseline/final measurements or graph
  extracts with their method, scope, snapshot, and source/check links; observed
  event times if history is shown; report and editable visual-source locations.
- **Organization:** mathematical map, proposed module boundaries, important
  interfaces, task dependency order, and current integration point.
- **Progress:** accepted work, active/ready tasks, unresolved decisions, remaining
  scope, migration map, and the next useful action.

If Git is absent, use a copied snapshot and file hashes. A timestamp alone is
insufficient to identify the source that a successful check validated.

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
