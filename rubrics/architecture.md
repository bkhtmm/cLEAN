# Mathematical architecture, placement, and imports

Use the [shared review rules](_common.md). Organize by mathematical meaning and
useful dependency boundaries. Inspect the whole scoped structure before
recommending a large reorganization; a file's name or its position in one proof
plan does not determine its mathematical home.

## Separate roles where they matter

Identify reusable objects/foundations, their public interfaces, project-specific
proof machinery, and applications/examples. These are roles, not mandatory
folders or a requirement for four layers. A general blow-up construction belongs
with the objects it develops; a specialized descent argument can remain with the
main proof. General facts found inside that argument may warrant extraction.

Give each moved declaration an explicit proposed home justified by its types,
meaning, dependencies, and consumers. Inspect an existing suitable module before
creating a new one. Shared filename prefixes can suggest a topic directory, but
an adjective or mathematician's name across unrelated subjects is insufficient.
Preserve useful existing organization instead of enforcing `Basic`/`Defs` names
or arbitrary file-size thresholds universally.

Main-result statements should be inspectable through reasonably small,
meaningful vocabulary modules. Locate the definitions a statement actually
uses, then distinguish those files from their import closure and the proof
machinery. Extracting definitions can reduce the statement-review burden;
introducing opaque stand-ins or axioms to shrink it changes the mathematics.
Some constructions require substantial proofs in their definitions; acknowledge
that dependency instead of promising every statement a tiny footprint.

## Check dependency direction

Earlier general mathematics should not import an application merely for a
useful helper. Propose moving the fact to a suitable common dependency, with its
consumers updated. Watch for circular imports introduced by definitions/API
splits, umbrella modules that reintroduce heavy dependencies, and generic
utility files accumulating unrelated material.

Use the project's pinned import-analysis tools when available. A broad import
may be justified during development but can impose a concrete avoidable cost on
reusable modules. Show the relevant dependency or measured rebuild effect.
Neither "always import every transitive dependency directly" nor "always remove
all direct transitive imports" is a portable policy: use the target's convention
and tooling. Do not delete an import solely because text search finds no
identifier from it; it may supply instances, syntax, attributes, or tactics.

File-import graphs overapproximate declaration dependencies. If reporting a
statement footprint, identify what was actually measured, include/exclude
external libraries consistently, and compare the same claims. Do not label a
plan hierarchy as a mathematical dependency DAG.

## Evidence and acceptance

A finding names the misplaced material, a concrete destination, the dependency
or consumer obstruction, and the tradeoff. For a larger change, show the proposed
import direction and first representative migration. Update all imports,
exports, explicit build roots, docs, and examples; retain migration shims only
as required by effective policy.

Acceptance combines preserved claims, affected builds, a usable public-module
consumer, and evidence for the claimed boundary improvement. A prettier folder
tree or fewer lines alone does not show a more reusable library.
