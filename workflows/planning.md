# Turn an audit into a refactoring plan

Read the operating contract in the main skill. Use an audit report, the target
snapshot, and the user's scope and budget. Produce an actionable plan without
changing the target library. A plan does not authorize its own execution.

If the audit is missing, follow [Audit](audit.md). If it is partial or stale,
refresh the evidence needed for the intended work rather than restarting every
check. Identify findings and dependencies that cannot yet support a repair.
For broad cleanup, the initial baseline and mathematical map can support a
first structural plan while individual theorem reviews continue; their eventual
coverage requirements remain unchanged.

## Establish scope and coherence

Judge proposed work against the user's requested outcomes, existing claims and
consumers, and effective project policies. Reassess existing material on its
merits even when it has already merged. Existing material may be reorganized,
replaced, documented, or deleted when required mathematics and useful interfaces
are preserved or migrated under the user's mandate and compatibility policy.

Use the [reuse retention criteria](../rubrics/reuse.md#decide-whether-keeping-the-declaration-serves-a-purpose)
to judge covered interfaces by their maintenance value. The absence of an
internal reference is insufficient to delete a public result; consider its
documented purpose, examples, external obligations, and consumer-search limits.

New supporting lemmas and modest generalizations belong in cleanup when they
directly enable an identified repair or reusable interface. Explain their role
and cost even when they were not named in the request. Keep unrelated new
formalization outside the mandate.

A coherent unit can span many files when it moves one interface and its users.
Choose units by dependency and acceptance boundaries, rather than a fixed diff
size or one-file rule. Separate unrelated cosmetic work when bundling it would
obscure review or failure isolation. A global plan can contain many such units.

For a scope issue, name the commitment, unsupported addition or loss, and a
narrower transformation that still satisfies the user. Check that benefits reach
the requested area; local polish does not complete an unresolved main repair.

## Establish the preservation and change boundaries

From the audit, record the claimed results to preserve, relevant definitions and
sources, permitted assumptions, and the baseline's verification limits. Describe
how proposed changes will continue to support the original claims.

Separate findings about an apparently incorrect mathematical claim from ordinary
refactoring. A missing prerequisite or ambiguous definition can block changes
that depend on it, while leaving independent cleanup work available. Do not solve
the ambiguity by weakening the claim or turning the missing result into an
assumption.

Use the initial compatibility policy: documented breaking changes are allowed,
with all affected in-repository uses migrated. Record any stricter project policy.
Choose preservation checks by transformation. Do not convert claim preservation
into a blanket signature freeze that excludes justified assumption reductions.
Keep dependency upgrades and unrelated new mathematical capabilities outside
ordinary refactoring unless they are part of the requested scope. Supporting
lemmas that directly enable a scoped repair belong in that repair.

## Propose coherent changes

Include contract simplifications and located dependency replacements alongside
structural changes. A useful bounded plan need not introduce or move modules.

Use [Structure](structure.md) to derive the layout early and plan moves, splits,
merges, and within-file organization. Schedule enabling boundaries before
granular cleanup of their affected consumers; independent local repairs need
not wait for repository-wide migration.

Use mathematical meaning and dependencies to choose boundaries. For each material
structural proposal, name the affected objects, declarations, and consumers, and
explain the benefit. Distinguish:

- Reusable mathematical objects and foundations.
- Their usable public interfaces.
- Machinery specific to the project's main argument.
- Examples or applications that consume the library.

These are roles, not mandatory folder names. Preserve useful existing structure.
Prefer an established abstraction in the pinned dependencies when it actually
fits. Propose a new abstraction when existing or concrete planned consumers
justify it, not merely because a reviewer can imagine future reuse.

Where it helps readers inspect main results, propose small modules containing the
definitions used by their statements, with appropriately limited dependencies.
Do not create a `Defs.lean` file for every topic by rule or move definitions in a
way that creates import cycles. Separate genuine general infrastructure from
proof-specific scaffolding; changing a path alone does not establish reusability.

For a changed interface or definition, describe the preservation evidence needed:
for example, a proof relating old and new formulations and derivation of the
original result through the replacement. Preserve enough of the original
specification to check that evidence. Compilation against declarations whose
meanings were changed is insufficient on its own.

If the evidence supports multiple reasonable organizations, select one and explain
the relevant tradeoff. Ask the user only when the unresolved choice affects the
intended mathematics, requested scope, or a compatibility or resource commitment
not already decided. Routine implementation choices remain with the agent.

## Prioritize by dependencies and demonstrated value

Use this as a default decision order, not a requirement to finish one category
across the entire repository before touching another:

1. **Resolve or isolate integrity and baseline uncertainty.** Identify which
   repairs lack a reliable specification or usable baseline. Put mathematical
   corrections in their own workstream, and keep unaffected work available.
2. **Establish useful contracts and enabling boundaries.** Consider assumption
   reductions and canonical library reuse alongside shared definitions, APIs,
   and dependency changes. Prioritize their actual dependencies and value.
3. **Recover demonstrated reuse.** Replace located duplication, extract shared
   reasoning, and generalize where an identified consumer benefits.
4. **Improve the affected units' maintainability.** Simplify brittle proofs,
   tighten dependencies, and improve names, documentation, and provenance.

Adjust the order for dependencies, confidence, consumer value, affected scope,
and compilation cost. A cheap cosmetic change may be wasted if the same material
is about to move or disappear. A small local fix may be worthwhile immediately
when it is independent. A widely used definition may offer high value while also
requiring an expensive migration. Explain those judgments without inventing a
single numerical quality score.

Plan a representative end-to-end unit before scaling up: enough shared material
and at least one relevant consumer to test the proposed interface and workflow.
Choose that unit for learning and value, not just because it is the easiest file.

## Define bounded work items

Use the canonical [task record](../references/records.md#task). Reference finding
IDs rather than duplicating their evidence. Include read/write boundaries,
prerequisites, interface agreements, preservation and migration work, acceptance
checks, and expected compilation cost. Investigation tasks produce evidence or a
decision; they do not apply a candidate fix as though it were established.

Bound the unit so its effect can be reviewed and checked. When practical, separate
mechanical file moves and import updates from changes to mathematical interfaces
or meanings. Keep all uses of a changed interface accounted for; a small diff
that leaves consumer migration undefined is not a bounded plan.

Label tasks as parallel candidates only when their edits and interface
dependencies are compatible. Disjoint filenames alone are insufficient if both
tasks change a shared definition, namespace, or import boundary. Route uncertain
interactions through a prerequisite task or order them sequentially. This plan
records concurrency opportunities; [coordination](coordinate.md) defines how
workers claim, execute, and integrate them.

## Specify acceptance and stopping conditions

For duplication findings, follow [repair and migration](inclusive-duplication.md#choose-and-verify-the-repair).
Plan evidence-backed proof delegation, declaration removal, or justified retention
according to the interface's role and maintenance cost. Deletions need consumer
migration and recovery witnesses. Keep proof-only reuse and declaration removals
separate in the records. Include a comparable baseline/final numerical evaluation
only when requested; a duplication flag alone is not a repair requirement.

For each batch, identify the affected build targets and consumers, the appropriate
axiom or statement-preservation checks, and a separate quality review. Reuse
existing project checks when they establish the needed property. Do not name a
checker that is unavailable as if it has already run; include setup or an explicit
verification limitation where necessary.

Name the expected evidence of improvement. Depending on the task, this could be:

- A consumer using an extracted public API without the original proof machinery.
- A located library result replacing duplicated reasoning while preserving uses.
- A smaller dependency footprint for the same theorem's statement vocabulary.
- More natural assumptions, with the original result still derivable.
- Measured build or recompilation cost under comparable conditions.

Keep these outcomes separate. A lower line count, faster build, or better model
review does not establish every other quality dimension. Compare the same scope
and claims when reporting before-and-after results.

Select work that fits the run's resource limits. If reliable costs are unknown,
use the first bounded unit to measure them before scaling across the declared scope.
Stop or revise a line of work when its prerequisite remains unresolved, its
expected benefit is no longer supported, or its cost exceeds the run's limits.
Report deferred work explicitly. Do not call partially completed work a finished
library cleanup.

For [whole-repository or broad multi-area work](campaign.md), keep a living backlog.
Include the next coverage gap or discovery question as well as ready repairs, and revise tasks
after integrated changes expose new consumers or remove their original cause.
Use the closure conditions before treating an exhausted plan as done.

## Deliver the plan

Return:

1. Target revision, scope, baseline limits, and preservation commitments.
2. The proposed organization and important design tradeoffs.
3. Prioritized work items, their dependency order, and parallel candidates.
4. The first representative batch and its expected acceptance evidence.
5. Breaking-change and migration notes, including affected internal consumers.
6. Verification requirements, resource limits, and unresolved decisions or work.

Use [Report](report.md) to explain the proposed changes and their intended
consumer benefit. Keep proposed boundaries and expected gains labeled as such.

State which parts of the plan are ready to execute and which are conditional.
Keep plan completion separate from task completion. For an end-to-end cleanup,
continue into [Repair](repair.md) under the existing authorization. For a planning
request, deliver the plan without editing the target. Use [Verify](verify.md) for
acceptance and [Coordinate](coordinate.md) when agents are actually available.
