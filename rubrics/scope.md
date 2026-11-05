# Scope and coherence of cleanup

Use the [shared review rules](_common.md). Judge the work against the user's
requested outcomes, the existing claims and consumers, and the effective project
policies. cLEAN does not require a TauCeti roadmap or presume everything already
merged is correct, useful, or permanently in scope.

Existing material can be reorganized, replaced, documented, or deleted when the
change preserves required mathematics and useful interfaces. The absence of an
internal reference is insufficient to delete a public result. Consider its
stated library purpose, examples, external compatibility obligations, and the
limits of the consumer search.

New supporting lemmas and modest generalizations belong in cleanup when they
enable the identified repair or reusable interface. Do not expand into an
unrelated formalization campaign because a missing theory looks interesting.
Likewise, do not reject a necessary supporting fact merely because it was not
named in the original request; explain its direct role and cost.

Separate mathematical correction and dependency upgrades from ordinary
refactoring. They can be included when requested, but require their own
specification, evidence, and task boundary. Preserve an unresolved claim as an
explicit issue rather than quietly deleting it from the project's goals.

A coherent unit can span many files when it moves one interface and its users.
Several unrelated cosmetic changes bundled with a structural migration make
review and failure isolation harder. Propose useful units based on dependency
and acceptance boundaries, not a fixed diff size or one-file rule. A global
organization plan can contain many sequential units without becoming many
unrelated projects.

For a finding, name the scope commitment, the unsupported addition or loss, and
a narrower transformation that still satisfies the user. Check that cleanup
benefits actually reach the requested area; endless local polish while the main
reuse obstruction remains is not completion.
