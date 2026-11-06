# Mathematical correctness and faithfulness

Use the [shared review rules](_common.md). Kernel checking establishes a proof of
the elaborated proposition under its assumptions. It does not establish that
the proposition or its definitions capture the intended mathematics.

## Inspect meaning before changing interfaces

Locate the actual statement, referenced definitions, source theorem or project
specification, and intended consumers. Expand enough definitions to understand
the objects and hypotheses; do not rely on names or fluent docstrings. Compare
quantifier order, dependent binders, universes where relevant, implication
directions, existence versus uniqueness, equality versus inequality, and the
intended domains. Check degenerate cases such as empty objects, zero, missing
inhabitedness, or characteristic restrictions when they bear on the claim.

Look for work displaced into assumptions: a structure that includes the desired
conclusion as a field, a predicate that simply restates the goal, or an
unproved prerequisite treated as an interface. Distinguish a legitimate abstract
theorem about objects satisfying useful laws from a claim that those objects
exist or that the original concrete theorem has been proved. A consumer of the
abstract theorem need not justify a claim about a concrete model.

For a new or semantically changed predicate, `Prop`-valued class, or hypothesis
structure, require either a meaningful consuming theorem or a nondegenerate
witness, already present or supplied by the refactor. Without either, leave the
dependent transformation unaccepted. Pure moves and renames may reuse existing
evidence. Record pre-existing gaps and continue independent cleanup.

A simple true lemma is not a vacuous theorem.
Vacuity means the claimed mathematical content disappears, for example through
an impossible hypothesis, empty quantification, or trivial stand-in definition.

If hypotheses appear inconsistent, locate the contradiction or demonstrate the
edge case. Do not demand a proof of consistency of every mathematical theory.
Missing source material makes faithfulness unresolved; it is not evidence of a
misformalization by itself.

## Protect the original contract

For a changed definition, inspect whether the same name now denotes a different
object. For a changed statement, recover the original result through the new
one using genuinely preserved definitions. Removing a hypothesis can be a useful
generalization; adding one may quietly narrow the result. Neither is a routine
style change. Representation changes need the appropriate relation and
transport, not necessarily literal equality of all internal data.

Use [verification](../workflows/verify.md) for proof holes, transitive axioms,
trusted specifications, and checked preservation. Do not infer faithfulness
from a green build or from unchanged printed theorem text. Check documentation
claims separately when the mathematics is sound but described too strongly.

## Finding and disposition

Name the exact claim/definition, intended source or unresolved intent, suspected
mismatch, affected result, and the evidence or test that establishes it. Show the
specific missing prerequisite instead of proposing it as a new trusted axiom.

Classify confirmed mathematical defects as explicit correction tasks and block
only transformations that depend on the disputed meaning. Continue independent
cleanup. Do not silently choose a different theorem, or force an AI-generated
repository to match a source it was never intended to formalize.
