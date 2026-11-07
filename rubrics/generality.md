# Natural generality

Use the [shared review rules](_common.md). Seek the level at which a mathematical
fact naturally belongs and serves identifiable uses, balancing generality
against interface and proof complexity.

Compare the exact signature with nearby local results and pinned library
abstractions. Look for unnecessarily fixed objects, excess algebraic/order or
topological structure, unused section parameters, unnecessary finiteness or
nonemptiness, accidental universe restrictions, and proofs duplicated across
specializations.

## Review the existing contract first

Separate removing unnecessary requirements from designing a broader abstraction.
For declarations within the recorded review scope:

1. Recover the actual arguments, including inherited section variables and
   instances. Check elaborated types when source context is misleading. Separate
   arguments needed to express the remaining statement from proof requirements.
2. Ask whether a requirement follows from retained hypotheses or supplied data,
   is needed only by the chosen implementation, or excludes cases where the
   conclusion still holds. Check relevant empty, zero, trivial, and boundary cases.
3. Investigate a concrete weaker signature with a local proof or adapter in the
   pinned environment. A failed deletion from the current proof does not establish
   mathematical necessity. Do not change the meanings of remaining objects or
   silently substitute incompatible instances to make the experiment pass.
4. Record supported reductions, justified retentions, and unresolved candidates.
   A syntactically unused argument may still be required by another binder or by
   an operation in the statement. Individually removable arguments need not be
   jointly removable; check the proposed combination.

A simpler existing public contract can be a material API benefit even when current
consumers already supply the stronger assumptions. Demonstrate the reduced burden
with its signature and a checked use; do not require inventing a new downstream
application. Balance that benefit against proof complexity and a documented reason
to retain a uniform or compatible interface. Leave expensive unproved extensions
as candidates or deferred work, not as resolved findings.

Removing a hypothesis strengthens the theorem's applicability. Recover the
original quantified claim and migrate affected uses under the effective policy;
use the generalized-theorem check rather than a blanket identical-type check.
If the excessive hypothesis changes a main theorem's advertised meaning, also
cross-reference correctness.

## Choose broader generality when justified

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

For a finding, supply the old and proposed signatures, the contract or consumer
benefit, original-result derivation, and relevant tradeoffs. Supporting lemmas
and proportionate assumption reductions belong to scoped cleanup; keep unrelated
new mathematical development outside it. Acceptance needs the generalized proof,
preservation, and checks of affected consumers or a representative public use.
A proposed elegant statement alone remains a candidate.
