# Apply a bounded refactor

Use the operating contract, a current plan, and the [task record](../references/records.md#task).
If asked to clean up a repository end to end, make the necessary audit and plan
and continue here. Do not require a separate approval simply because a plan now
exists. For audit-only or planning-only requests, do not apply repairs.

## Prepare the unit

1. Check that the base snapshot, pinned dependencies, relevant baseline failures,
   findings, and interface agreements still match. Refresh affected stale
   evidence. Inspect the user's uncommitted work and preserve it; do not reset,
   overwrite, stash, or commit unrelated changes.
2. Select a dependency-ready task with a bounded migration and meaningful
   acceptance check. For a large redesign, start with a representative foundation
   and consumer before scaling the pattern to the remaining scope.
3. Preserve the relevant original specification and definition meanings before
   editing them. Use [Verify](verify.md#preserve-the-specification) to choose the
   evidence. Keep this reference outside the worker's editable candidate.
4. Use an isolated branch/worktree when it prevents collisions or makes rollback
   reliable. With no Git, preserve the affected files in the run directory.
   Record what the worker may edit and which shared interfaces are fixed.

If the baseline is broken, scope a unit whose checks can distinguish its own
regressions. Do not silently repair unrelated failures or call the whole tree
verified. An unavailable compiler permits an explicitly unverified patch only
when a source-level change is still meaningful; leave acceptance pending.

Before editing, establish the [theorem inventory](audit.md#theorem-coverage) and
baseline measurements required for the declared scope. A named local repair
uses its affected scope; a full cleanup retains individual coverage of all
in-scope theorems, including unchanged ones. Preserve baseline inputs rather
than reconstructing improvement counts from an implementation summary.

## Transform by mathematical contract

Choose the relevant transformation, not every step below:

- **Replace implementation:** locate the replacement in the pinned library,
  compare contracts, and demonstrate the adapter. Retain a public wrapper when
  it supplies a real API, automation, or compatibility role under project policy.
- **Extract a fact:** formulate the shared mathematical statement, give it its
  natural home with minimal suitable dependencies, prove it, and migrate the
  identified consumers. Export useful infrastructure; keep argument-specific
  steps local when that is their actual role.
- **Separate definitions:** move statement vocabulary and necessary construction
  dependencies into an earlier module when this reduces the reader's dependency
  burden. Provide its characteristic API separately if useful. Definitions that
  require proofs to construct their objects still need those proofs; do not
  introduce axioms, placeholders, or circular imports to create a small file.
- **Reorganize modules:** move coherent topics together and update imports,
  umbrella modules, explicit Lake library roots/globs or targets, tests,
  examples, docs, and generated-doc configuration where applicable. Preserve
  dependency direction. Mechanical moves should be distinguishable from
  mathematical interface changes in the diff or successive local units.
- **Improve an API or generalize:** implement a concrete proposed signature,
  prove the required relationship to the original, and migrate consumers. Check
  implicit arguments, universes, instance search, coercions, notation, and
  computation behavior when used. Avoid adding unused abstraction.
- **Rewrite a proof:** retain the intended statement and prefer a clear, stable
  argument. Use automation or explicit lemmas as appropriate; preserve useful
  intermediate mathematics rather than hiding it inside a successful tactic.

Apply the relevant rubrics from the [entry point](../SKILL.md#review-quality).
Avoid broad search-and-replace across identifiers without checking their
namespaces and uses. Renaming a declaration can also affect attributes,
`to_additive` products, generated declarations, docs, and tooling. Text search
helps locate candidates; compilation and consumer checks establish migration.

A public theorem's being unused internally does not establish that it is dead.
Consider documented purpose and external compatibility before deletion. When
removing abandoned scaffolding or examples, record why they are not needed to
preserve claims, useful interfaces, provenance, or checks. Move useful examples
out of foundations rather than deleting their mathematical coverage for a
smaller line count.

## Check while editing

Build the changed leaf or module first, then the actual affected consumers and
higher-level targets. Use the project's documented commands and installed tool
versions. Keep logs and identify the candidate checked. Batch changes that share
an expensive rebuild when it remains possible to isolate failures; avoid
repeated whole-repository builds while the same shared interface is unstable.

When a check fails, inspect the diagnostic and causal change before editing.
Do not fix a build by weakening assumptions policy, deleting the target from
build configuration, removing a failing consumer, loosening a specification, or
raising resource limits across the repository without evidence. A local
performance adjustment needs an explanation and comparable measurements.

If the proposed abstraction does not fit a consumer, revise the bounded design
and update dependent tasks before expanding. If the original mathematics appears
wrong, stop that dependent transformation and open a separate correction or
intent investigation. Continue independent authorized work.

Keep [theorem review records](../references/records.md#theorem-review) current as
the unit changes. Map moved, renamed, split, merged, and removed declarations to
their inventory identities; add new helpers for both checks. Mark affected
reviews stale when definitions, instances, dependencies, or available replacement
APIs change, even if a theorem's text does not. Refresh those reviews before
claiming their coverage is complete; reuse evidence whose inputs remain valid.

## Review and integrate

Run the task's acceptance checks using [Verify](verify.md), including the
specific benefit promised by the plan. Check the complete diff for accidental
changes to configuration, mathematical statements, definitions, attributes, and
source credit. A successful leaf build is not task acceptance when migration or
preservation is outstanding.

For multi-agent execution, use [Coordinate](coordinate.md). With one agent, do a
separate review pass against the original contract and evidence; do not describe
it as an independent review. In either case, return defects to implementation
until acceptance is met or a concrete limit is reported.

Integrate only coherent units with their consumers and migration records. Check
the combined candidate again when integration changes inputs. Keep the final
candidate free of temporary exploratory code and new proof holes. Never discard
the user's edits to obtain a clean status.

Record each [verified improvement](../references/records.md#verified-improvement)
with its original/final declarations and checks. Count assumption removals and
Mathlib replacements only when the corresponding change is verified, integrated,
and retained in the final candidate. Keep candidates, unverified patches, and
local reuse separate; adjust totals after reversions or overlapping repairs.

## Deliver

Use [Report](report.md) to explain the observed benefit and how consumers use the
result, including its numerical summary and selecting visuals only when they
help communicate the actual change. Reconcile final theorem coverage using
[Verify](verify.md#reconcile-theorem-coverage) before claiming a full cleanup.

Return the reviewed patch, task state, old-to-new declarations/modules, check
records, observed improvement, and unresolved findings. Keep optional upstream
candidates as local notes unless submission was requested. Execute further
ready tasks within the authorized scope; stop only for completion, a real
unresolved dependency, or a resource limit, with the remaining state recorded.
In [campaign mode](campaign.md), return each integrated batch to discovery and
coverage review. A finished task or empty initial backlog is not campaign closure.
