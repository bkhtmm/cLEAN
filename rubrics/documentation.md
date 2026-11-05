# Documentation and discoverability

Use the [shared review rules](_common.md). Documentation should help readers
choose, understand, and use the mathematics that is actually formalized.

For substantive modules, look for a useful module docstring identifying the
objects/results, organization, main entry points, and important dependencies or
mathematical context. Public definitions, main results, non-obvious instances,
and surprising conventions need enough explanation to use correctly. Routine
lemmas with self-explanatory statements do not require repetitive prose merely
to increase documentation coverage.

Compare claims with actual signatures and definitions. Flag omitted hypotheses,
missing directions, wrong sources, stale names/paths, or claims of completeness
that exceed the formalization. If the theorem is mathematically sound but its
description overclaims, fix the description without silently changing the claim.
If intended meaning itself is disputed, cross-reference correctness.

Explain mathematical purpose and non-obvious choices. Keep transient task IDs,
agent ownership, status, and execution logs in run records rather than permanent
module docs. Comments explaining a tricky proof or representation choice can be
valuable; do not ban proof explanations from the library.

A reusable repository should offer a discoverable route from main results to
objects, API modules, examples, and source references. Improve existing guides
when possible; avoid duplicate documentation that will drift. Update relevant
blueprints, theorem/source maps, links, and documented imports during moves.
A blueprint's existence is not proof that it agrees with Lean.

For a finding, identify the reader task, located misleading or missing content,
and an accurate replacement or example. Acceptance includes checking names,
links, import examples when executable, and the statement/documentation match.
Missing informal sources limit claims of faithfulness and belong in the report.
