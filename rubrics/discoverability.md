# Discoverability: names, notation, and documentation

Use the [shared review rules](_common.md). Help readers find, understand, and use
the mathematics actually formalized. Judge a name, notation, or explanation by
the reader task it supports and the confusion or burden it creates.

## Names and notation

Before checking or changing names, read the bundled
[Mathlib naming conventions](../references/mathlib-naming-conventions.md).
Use that guide as the default naming standard and cite the applicable rule when
reporting a convention violation. Its source revision and retrieval date are
recorded in the file; compare relevant examples with the project's pinned
Mathlib when version differences matter. Honor explicit project exceptions and
compatibility requirements.

Read neighboring declarations and the pinned library to understand existing use
and plan a coherent migration. An existing nonstandard naming pattern does not
by itself justify retaining it.

Prefer theorem names describing conclusions and relevant hypotheses over proof
stage names, task numbers, or tactic names. Check that a name does not advertise
an equivalence, uniqueness, or equality when the statement proves less. Cite a
located convention or consumer problem when terminology is said to be nonstandard.
Follow Mathlib casing conventions where applicable; mechanical style
enforced by existing tooling need not be rediscovered as a semantic finding.

Use namespaces that fit the object and established extension conventions.
Confirm dot-notation behavior with actual argument inference where relevant.
Do not require one namespace policy for all projects or treat every organizational
namespace as a type namespace. Avoid collisions, misleading shadowing, and aliases
that merely obscure the canonical API.

Introduce notation when it supports the mathematical interface. Check precedence,
scope, and interaction with existing notation; prefer scoped/local notation when
that meets the use. A symbol without a source convention or reader benefit may
make a result harder to find or understand.

## Documentation and navigation

For substantive modules, look for a useful module docstring identifying the
objects/results, organization, main entry points, and important dependencies or
mathematical context. Public definitions, main results, non-obvious instances,
and surprising conventions need enough explanation to use correctly. Routine
lemmas with self-explanatory statements do not require repetitive prose merely
to increase documentation coverage.

Compare claims with actual signatures and definitions. Flag omitted hypotheses,
missing directions, wrong sources, stale names/paths, or claims of completeness
that exceed the formalization. If the theorem is sound but its description
overclaims, correct the description. If intended meaning itself is disputed,
cross-reference [correctness](correctness.md).

Explain mathematical purpose and non-obvious choices. Keep transient task IDs,
agent ownership, status, and execution logs in run records rather than permanent
module docs. Comments explaining a tricky proof or representation choice can be
valuable; do not ban proof explanations from the library.

A reusable repository should offer a discoverable route from main results to
objects, API modules, examples, and source references. Improve existing guides
when possible; avoid duplicate documentation that will drift. A blueprint's
existence is not proof that it agrees with Lean. Missing informal sources limit
claims of faithfulness and belong in the report.

## Evidence and acceptance

Identify the reader task, exact declaration or misleading/missing content, and
the concrete confusion avoided. For a rename, provide the old/proposed names,
statement, and neighboring precedent or source terminology. For documentation,
give an accurate replacement or example.

Update uses, docs, generated declarations, attributes, migration notes, blueprints,
source maps, links, and documented imports where affected. Coordinate naming and
documentation with a structural/API change to the same unit. Do not trigger a
wide recompilation just to replace one defensible spelling with another.

Acceptance checks migration, the effective compatibility policy, names and links,
executable import examples where applicable, and agreement between descriptions
and actual statements.
