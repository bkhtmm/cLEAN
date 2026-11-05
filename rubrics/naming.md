# Naming and notation

Use the [shared review rules](_common.md). Names should let a consumer find a fact
and anticipate its mathematical content. Read neighboring declarations and the
pinned library before proposing a rename. Cite a located convention or consumer
problem when terminology is said to be nonstandard.

Prefer theorem names describing conclusions and relevant hypotheses over proof
stage names, task numbers, or tactic names. Check that a name does not advertise
an equivalence, uniqueness, or equality when the statement proves less. Follow
local/Mathlib casing conventions where applicable; mechanical style enforced by
existing tooling need not be rediscovered as a semantic finding.

Use namespaces that fit the object and established extension conventions.
Confirm dot-notation behavior with actual argument inference where relevant.
Do not require all projects to use one namespace or treat every organizational
namespace as a type namespace. Avoid collisions, misleading shadowing, and new
aliases that merely obscure the canonical API.

Introduce notation only when it supports the mathematical interface. Check
precedence, scope, and interaction with existing notation; prefer scoped/local
notation when that meets the use. A symbolic notation with no source convention
or reader benefit is a potential discoverability cost, not an improvement by
definition.

A rename must update uses, docs, generated declarations and attributes where
affected, and migration notes. Do not trigger a wide recompilation just to
replace one defensible spelling with another. If the same module/API is about
to change structurally, coordinate naming with that unit.

For a finding, provide the old/proposed name, exact statement, neighboring
precedent or source terminology, and the concrete confusion avoided. Check
migration and the effective compatibility policy before acceptance.
