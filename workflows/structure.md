# Establish repository structure

Use for repository reorganization and broad library audits, plans, or cleanups.
Derive a layout from the actual mathematics, dependencies, and consumers. The
[architecture rubric](../rubrics/architecture.md) judges the resulting boundaries;
this workflow explains when to establish them and how to migrate them.

## Establish boundaries early

Start after the [initial baseline and mathematical map](audit.md#map-the-mathematical-structure),
before widespread theorem, definition, or proof polishing. Inspect source roots,
build coverage, shared objects, main-result vocabulary, and representative
consumers. Check likely local or pinned-library replacements before investing in
reorganizing material that may disappear.

An initial structural plan need not wait for every theorem review to finish.
Before edits, capture the required theorem inventory, baseline measurements, and
preservation references. Keep remaining individual reviews pending; this early
pass does not satisfy their coverage requirements. Uncertain mathematical
specifications can block dependent migrations while independent work proceeds.

For an authorized cleanup, establish enabling boundaries before granular cleanup
of their affected consumers. Validate a representative foundation and consumer,
then migrate further coherent batches. A large repository need not finish every
move before any detailed work begins. Refine the layout when actual consumers or
dependencies justify it; retain accepted boundaries otherwise.

Audit-only and planning-only work records decisions without changing target
sources or configuration. A focused repair inspects its affected boundaries and
does not trigger a repository-wide redesign. Sound existing organization can be
retained with a brief reason and no structural edits.

## Choose a layout that fits the repository

Treat mathematical breadth and internal scale as separate dimensions:

| Actual contents | Useful starting organization |
| --- | --- |
| Small, focused on one topic | A few descriptive modules under the library root |
| Large, focused on one topic | Subtopics, constructions, objects, or substantial theorem families |
| Small, covering several topics | Topic modules or light subject grouping |
| Large, covering several domains | Domains, then topics or objects, then individual developments |

These are examples, not size thresholds or required folder names. Start at the
level where the contents meaningfully divide. A specialized library need not
repeat its sole domain in an extra directory; an established prefix can still
serve useful consistency or integration needs. Grow individual topics from files
into directories when distinct developments justify it. Depth can vary by branch.

Choose mathematical homes using declarations' types, meaning, prerequisites, and
consumers. Give interactions between subjects one justified home. Separate shared
foundations from argument-specific machinery where independent use benefits;
keep genuinely specialized helpers with their argument. A theorem or construction
can itself name a coherent topic. Follow the architecture rubric's role and
placement criteria rather than inventing a generic utilities layer.

Choose module boundaries by what a consumer should be able to import independently.
Keep elementary vocabulary accessible without unrelated later theory. `Defs`,
`Basic`, and theorem-specific filenames are options; do not require the same
file set in every folder or split solely by declaration keyword. Foundational
modules may include elementary lemmas. File-size rules come from the project;
size alone does not determine a useful boundary.

Within each file, group coherent developments and related API around their
definitions, with prerequisites before consumers. Use namespaces and sections to
control names and assumptions; follow the target's header and documentation
conventions. Preserve useful separation of library sources, examples, tests,
documentation, and tooling without creating empty template directories or
relocating infrastructure merely for uniformity.

## Layout excerpts

These trees show selected existing paths from
[Mathlib](https://github.com/leanprover-community/mathlib4/tree/f78acaf72ad85f1dc68259a994f3e2f1494fa334/Mathlib)
and [TauCeti](https://github.com/TauCetiProject/TauCeti/tree/7b3aaabdeaef0c48b006d1ff4aa81e1f83ba020e/TauCeti),
pinned to the snapshots reviewed on 15 November 2026.
Unshown files and branches are omitted throughout; neither tree is a complete
listing or a prescribed template. Folder nesting shows topic organization, not
import direction.

### Mathlib

```text
Mathlib/
├── Algebra/
│   └── Group/
│       └── Action/
│           ├── Defs.lean
│           ├── Basic.lean
│           └── Hom.lean
├── Dynamics/
│   ├── Flow.lean
│   └── BirkhoffSum/
│       ├── Basic.lean
│       ├── Average.lean
│       └── Integrable.lean
└── MeasureTheory/
    └── Integral/
        └── Bochner/
            └── Basic.lean
```

The outer folders identify subjects; inner folders identify objects or
developments. Group-action [definitions](https://github.com/leanprover-community/mathlib4/blob/f78acaf72ad85f1dc68259a994f3e2f1494fa334/Mathlib/Algebra/Group/Action/Defs.lean)
and [basic results](https://github.com/leanprover-community/mathlib4/blob/f78acaf72ad85f1dc68259a994f3e2f1494fa334/Mathlib/Algebra/Group/Action/Basic.lean)
document a split based on import requirements. The
[Birkhoff-sum integrability module](https://github.com/leanprover-community/mathlib4/blob/f78acaf72ad85f1dc68259a994f3e2f1494fa334/Mathlib/Dynamics/BirkhoffSum/Integrable.lean)
imports both averages and Bochner integration, giving the interaction between
subjects its own module. A single-file topic such as flows can coexist with a
topic developed across several files.

### TauCeti

```text
TauCeti/
├── Algebra/
│   ├── WordFiltration/
│   │   ├── Basic.lean
│   │   ├── AssociatedGraded.lean
│   │   └── Noetherian.lean
│   └── Lie/
│       └── UniversalEnveloping/
│           └── PBW/
│               └── Noetherian/
│                   ├── Basic.lean
│                   └── Opposite.lean
└── LinearAlgebra/
    └── SymmetricAlgebra/
        └── Noetherian.lean
```

The [PBW Noetherian module](https://github.com/TauCetiProject/TauCeti/blob/7b3aaabdeaef0c48b006d1ff4aa81e1f83ba020e/TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Noetherian/Basic.lean)
imports the general word-filtration transfer and the symmetric-algebra
Noetherian result from their respective mathematical homes. This keeps those
ingredients available independently of the specialized application. The deeper
PBW branch reflects its local development; other branches need not match its
depth. TauCeti also develops flows through a
[`Dynamics/Flow/` directory](https://github.com/TauCetiProject/TauCeti/tree/7b3aaabdeaef0c48b006d1ff4aa81e1f83ba020e/TauCeti/Dynamics/Flow),
extending the subject represented by Mathlib's `Dynamics/Flow.lean` above.

## Record a concrete migration

Use the existing [run organization and task records](../references/records.md),
with inline decisions for a small job. Record:

- Which existing organization is retained, and each proposed module destination
  or split/merge, justified by its mathematical role and intended consumer use.
- The relevant import direction, public entry points, and old-to-new module and
  declaration mappings, preserving theorem inventory IDs across relocation.
- A first bounded migration with its consumers, affected build/export references,
  preservation checks, and observable benefit. Mark unresolved boundaries as
  investigations rather than speculative moves.

A folder tree describes navigation; imports describe module dependencies. Inspect
both. Check Lake source directories, roots/globs, executable targets, and umbrella
modules before choosing the build and export changes. A root module may re-export
the library or intentionally be empty; neither policy is universal.

## Migrate coherent units

Apply through [Repair](repair.md), using the pinned toolchain and effective
compatibility policy. Distinguish these transformations:

- **Whole-module move:** move the source, using `git mv` when appropriate, and
  migrate references to the old module path. Lean derives import names from paths
  relative to configured source roots; the `module` keyword does not declare a
  full path. Update imports in consumers and in moved files whose dependencies
  also moved. Declaration namespaces are independent of module paths: moving
  `Project/Helpers.lean` to `Project/Algebra/Helpers.lean` does not require renaming
  `Project.helper`. Preserve declaration names unless a naming change is planned.
- **Split or merge:** relocate coherent declaration blocks in dependency order.
  Reconstruct their namespaces, sections, universe/variable declarations,
  `include`/`omit` context, local notation and instances, attributes, options, and
  `noncomputable` context as applicable. Preserve attribution. A new file does
  not inherit the original file's local context. With automatic implicit
  variables enabled, a lost variable declaration can silently change a theorem's
  parameters even when the extracted text compiles. Carry associated attribute
  and notation registrations and helper dependencies, including those declared
  elsewhere in the original file.
- **New API boundary:** account for private helpers and, where supported by the
  pinned module system, public/private scopes, exposed definition bodies, and
  `import`/`public import`/`import all` behavior. A proof formerly beside a
  definition may lose access to its body. Choose the intended public API or
  internal access deliberately; do not expose everything merely to fix a split.
  Keep any necessary proof adaptations distinguishable from changes to contracts.

Inspect the resulting import graph for cycles and accidental dependencies on
former umbrella modules. Merges and broader imports can change available
instances and automation; preserve the intended consumer behavior. For pure
relocations, retain mathematical contracts and definition meanings. Plan any
generality, representation, or other interface change separately with the
appropriate preservation evidence; a folder migration does not justify it.

Migrate in-repository uses and applicable umbrella imports, Lake targets,
examples, tests, documentation links, CI paths, scripts, and documentation-build
configuration. Remove superseded sources once consumers are migrated; copied
implementations are not a completed move. Keep forwarding paths only when the
effective compatibility policy calls for them.

## Accept the batch before expanding

Use [Verify](verify.md#check-migration-and-integration) to check every destination
module, affected consumers, and final targets. For splits, merges, or changed
context, compare elaborated signatures, explicit/implicit binders, universe
parameters, and definition meanings against the baseline; check relevant
visibility, notation, instances, attributes, and computation behavior. Compilation
alone cannot establish preservation. Do not let orphaned sources or stale build
artifacts hide a missing migration.

Demonstrate the promised benefit, such as a consumer importing shared mathematics
without the original proof machinery, or a coherent mathematical topic becoming
findable at its documented home. Record the verified mappings and remaining
boundaries in the existing run state, then continue the scoped cleanup. Directory
counts and a prettier tree alone do not establish improvement.
