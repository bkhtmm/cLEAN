# Verify a refactor

Verify the exact candidate, against a named baseline and the task's acceptance
conditions. Read the operating contract and [check record](../references/records.md#check).
Use existing project tooling when it establishes the required property. Scale
checks to the transformation; do not invent an expensive independent checking
infrastructure for a local rename, or call a rename sufficient evidence for a
changed mathematical definition.

## Establish the check environment

Record the revision/patch, relevant uncommitted changes, `lean-toolchain`, pinned
dependency manifest, Lake configuration, and relevant options. Keep them fixed
through ordinary cleanup. Run the documented build/check commands from the
target root and record their real results. Inspect build configuration when
necessary: a successful default target need not compile every library, example,
benchmark, executable, or challenge file.

Use the project's normal execution environment and host protections. Lean
elaboration and build scripts can execute code; ordinary compilation does not
provide the isolation or independent trust guarantees of a separately configured
proof comparator. Do not describe a trusted local development check as an audit
of arbitrary adversarial compiler extensions.

For orientation, a Lake project commonly supports:

```sh
lake env lean --version
lake build
lake env lean path/to/ConsumerProbe.lean
```

These are examples, not a universal check list. Discover actual targets and
supported options in the pinned toolchain; do not guess a linter, import-analysis,
comparator, or timing command and report it as run. A `lake env lean` probe may
need imported project modules built first. Keep probes in the run directory or
a designated test location and record how the module search path is configured.

## Preserve the specification

Before editing important signatures or definitions, retain the original
specification and its relevant definition dependencies in a baseline snapshot
outside the candidate's write boundary. Reuse trusted project challenge files
when available, identifying their revision and ownership. Preserve the meanings
of the objects in a claim, not only a pretty-printed type mentioning their names.

Choose evidence appropriate to the change:

| Transformation | Required preservation evidence |
| --- | --- |
| Proof body only | The same elaborated statement and unchanged referenced definition meanings, with the replacement proof checked and its axioms inspected as appropriate |
| Move or rename | Old-to-new mapping, corresponding statements/definitions, migrated consumers, and relevant namespace/attribute behavior |
| Generalized theorem | A checked derivation of the original quantified claim through the new theorem, with no added assumptions |
| Replaced definition or representation | A checked equality, equivalence, isomorphism, or other mathematically appropriate relation to the preserved object, plus transport of the claimed properties and consumer behavior that matters |
| Restructured main theorem API | Checked recovery of every affected original main claim through the new API, retaining its intended objects and permitted assumptions |

A copied theorem statement importing changed candidate definitions is not an
independent reference. A theorem `newResult : NewProperty` does not preserve the
old result merely because the text once also read `NewProperty`. Likewise,
proving an equivalence after redefining both sides proves nothing about the
original meaning. A bridge must refer to genuinely preserved definitions or an
independently trusted specification. Preserve required computation/reduction
behavior when consumers use definitions computationally; logical equivalence of
predicates alone does not preserve such behavior.

Use a compatible statement-comparison tool when the project has one, especially
for major result boundaries. Keep its trusted challenge and configuration
separate from editable solution code; record the compared declarations, allowed
axioms, checker version, and actual guarantees. Check the pinned tool's
documentation: Comparator functionality moved into Lean/Lake starting with
v4.35.0; older projects may use the standalone project. Do not upgrade the target
just to obtain a checker. See the [upstream Comparator documentation](https://github.com/leanprover/comparator)
for the transition and trust assumptions. A checker that deliberately leaves
some definitions open cannot establish their intended mathematical meaning.

If no compatible tool is available, use explicit preservation proofs and
source/definition review appropriate to the task, and state the limits. A
non-definitional representation change may require transport proofs instead of
an equality comparator. If necessary preservation evidence cannot be produced,
leave that task unaccepted; do not weaken its requirement to "it builds".

## Check proofs and trusted assumptions

Compare new and baseline holes and assumptions. A text search for `sorry`,
`admit`, or `axiom` is useful triage, not a transitive axiom audit: it can match
comments, miss elaborator-generated holes, and miss assumptions in imports.

Use project axiom checks or Lean's `#print axioms` for affected results, relevant
new public declarations, and the main claims whose proof paths changed. For
example, in a probe importing an actually existing candidate module:

```lean
-- Replace these identifiers with located target declarations.
import Project.Main
#print axioms Project.mainResult
```

Record the returned constants and compare them with the effective project
policy and baseline. `sorryAx` indicates a proof hole. Custom axioms can enter
transitively even when changed source contains no `axiom` declaration. Do not
silently assume that every project permits the same axioms; many classical Lean
projects permit `propext`, `Classical.choice`, and `Quot.sound`, but the project's
stated policy governs. If none is documented, report the baseline and require no
new trusted assumptions; leave any broader trust certification unresolved.

Check newly exposed public results as well as final roots: an unused hole in a
new reusable lemma may not occur in a main theorem's axiom list. Record existing
incomplete areas separately. A build that emits a sorry warning is still not a
hole-free verification. Do not disable linters or exclude failing files to make
the evidence appear green.

## Check migration and integration

Build the changed modules, affected consumers, and required final targets.
Include examples and other targets outside the default build when affected.
Run relevant configured linters and import checks; do not repeat an unchanged
check solely to produce more logs.

Inspect old-to-new names and paths in sources, imports, umbrella files, docs,
examples, tests, build targets, attributes, generated names, and auxiliary tools.
Check intended retained aliases separately from accidental duplicates. A
consumer probe should import the proposed public module, not an umbrella module
that silently restores removed dependencies. Exercise applicable rewrite,
extensionality, typeclass, coercion, and notation behavior without unfolding
internal implementation merely to make the probe succeed.

For merged work, rerun affected checks against the combined candidate. A
successful worker build is evidence about that worker's snapshot. Run the final
repository checks required by the plan; if a full build is unaffordable or
unavailable, report the exact unchecked boundary. Routine use of valid pinned
build caches is fine. Force a fresh or targeted rebuild when stale artifacts,
removed modules, or changed build configuration could mask missing coverage.

## Verify the claimed improvement

Revisit the relevant rubrics and the concrete acceptance condition:

- Does an actual consumer use the extracted API without importing the original
  application machinery? Label synthetic probes as probes, not discovered users.
- Did the located existing result replace duplicated implementation while useful
  public behavior remained available?
- Are definition-containing modules and their transitive imports smaller for
  the same main statements? Distinguish definitions used by the statement from
  proof dependencies and unrelated library files.
- Can a weaker-assumption statement serve the identified consumer, with the old
  result still derivable?
- Are names, docs, and source mappings accurate after moves?

If measuring dependencies, state whether the graph is file imports or actual
constant dependencies, and whether dependency packages are included. If measuring
performance, compare the same targets, toolchain, hardware/resources, and cache
conditions; label cold, warm, and incremental runs. File count and line count
are context, not standalone quality goals. No speed claim follows from a
smaller-looking import list alone.

## Accept or return

Accept a task only when its required build, preservation, trust, migration, and
quality evidence is satisfied. Return a defect to repair; mark missing checks
`unavailable` or `not_run`, with task acceptance pending. Do not describe a
partially verified candidate as a completed verified cleanup.

Deliver the candidate identity, passed/failed/unperformed checks with scope,
preserved claims, observed quality changes, migration notes, remaining findings,
and limits. Distinguish a completed review that found problems from a patch that
passed all required checks. Independent kernel/statement checks and mathematical
faithfulness review answer different questions; retain both where needed.
