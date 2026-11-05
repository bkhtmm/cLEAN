# Natural generality

Use the [shared review rules](_common.md). Seek the level at which a mathematical
fact naturally belongs and serves identifiable uses, balancing generality
against interface and proof complexity.

Compare the exact signature with nearby local results and pinned library
abstractions. Look for unnecessarily fixed objects, excess algebraic/order or
topological structure, unused section parameters, unnecessary finiteness or
nonemptiness, accidental universe restrictions, and proofs duplicated across
specializations. Check the elaborated declaration when section variables,
instances, or implicit binders make the source signature misleading.

A syntactically unused typeclass can still be needed for another binder or an
operation's meaning. Demonstrate the weaker assumptions or proposed abstract
signature with a proof/consumer rather than deleting hypotheses by inspection.
If the excessive hypothesis changes a main theorem's advertised meaning,
cross-reference correctness rather than treating it solely as API quality.

Prefer a general core with useful specializations when this removes repeated
maintenance. A specialization may still deserve a named lemma for automation,
argument inference, or discoverability. Concrete computational implementations
may also have performance roles that an abstract replacement does not preserve.

Flag over-abstraction too: parameters with no intended instantiation, a new class
that duplicates an existing concept, or a framework that makes identified users
harder without supporting a demonstrated need. A main result or documented
library purpose can justify abstraction even before a second in-repository
consumer exists. Multiple files with similar syntax alone do not justify one
common mathematical contract.

For a finding, supply the old and proposed signatures, evidence from conventions
or consumers, the original-result derivation, and relevant tradeoffs. Keep any
new mathematical capability outside the cleanup scope unless authorized.
Acceptance needs the actual generalized proof, its relevant consumer, and
preservation; a proposed elegant statement alone remains a candidate.
