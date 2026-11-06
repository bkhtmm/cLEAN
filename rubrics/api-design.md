# Public API and mathematical objects

Use the [shared review rules](_common.md). Judge whether consumers can construct,
recognize, compare, and use the library's objects through a coherent interface.
Minimal public surface is useful only together with sufficient expressive power.

## Exercise the interface

Locate a definition and a real consumer, or construct a clearly labeled probe
representing the documented purpose. Try to use its public facts without
unfolding implementation-specific representations. Depending on the object,
useful characteristic facts include constructors and elimination rules,
membership or evaluation lemmas, extensionality, universal properties,
composition/identity laws, and interaction with operations already in scope.
Require what the actual mathematics needs, not every possible lemma family.

Inspect argument order, implicit inference, universe constraints, coercions,
namespace placement, and typeclass instances. Identify a concrete failure or
unnecessary burden, rather than treating a preferred binder style as a defect.
Check interactions between global instances and existing ones; an instance can
change unrelated consumers through ambiguous or expensive search.

A bundled object's equality must reflect the mathematical object it denotes.
Require an extensionality argument based on its meaningful data. Report
unconstrained fields or irrelevant indexed values that defeat this property,
even without an existing equality consumer. Require removing or constraining
that freedom. Any intentionally retained additional data must have a documented
mathematical role and equality contract.

## Expose the useful mathematics

An argument-specific helper can remain private or local. A fact about general
objects that has a useful independent contract should have an appropriate public
home, even when first discovered inside one proof. Generality is not a reason
to hide it. Conversely, moving a project-specific step to a public utility
module does not make its contract reusable.

Keep representation details behind characteristic lemmas when this helps
consumers survive implementation changes. Some definitions intentionally
support reduction or computation; preserve that role rather than imposing an
opacity rule. Do not require version-specific attributes such as exposure
controls without confirming support and a consumer need in the pinned Lean.

Check that normal-form rewrite rules have appropriate `@[simp]` annotations,
intended grind rules have `@[grind]`, and applicable extensionality lemmas have
`@[ext]`, using tooling supported by the pinned environment. Report missing or
incorrect annotations. Check rewriting direction, loops, interactions, and
representative consumers. Preserve specialized lemmas that serve a useful
public interface. The [reuse rubric](reuse.md) explains that distinction.

## Acceptance evidence

Give the missing or obstructive operation, located consumer, proposed signature
or placement, and a probe demonstrating the improvement. Check preserved
contracts, automation, generated declarations where relevant, and migrated
uses. Apply the effective compatibility policy: remove redundant surface when
justified; retain required migration support when the project calls for it.
Do not import TauCeti's unconditional no-compatibility policy.
