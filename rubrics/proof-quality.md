# Proof clarity, stability, and maintenance

Use the [shared review rules](_common.md). A good proof reveals the relevant
mathematical structure and can survive reasonable interface changes. Proof
length or tactic choice alone does not determine that quality.

Look for repeated substantial arguments, opaque blocks hiding useful facts,
manual reimplementation of available API, and long chains tied to incidental
representation or coercion details. Locate the repeated reasoning and proposed
shared statement before demanding extraction. Keep genuine one-offs inline
when a new lemma would add naming and dependency burden without benefit.
A general reusable fact may deserve a public home even if it appears once.

Choose automation or explicit lemmas for clarity, stability, and cost in the
pinned environment. Automation can replace fragile rewrite chains; an explicit
calculation can better expose the argument. A tactic choice alone is not a
finding. Avoid dependence on incidental unfolding or unrelated global rules.

`change` and `show` can clarify a goal or type and do not require comments merely
because they occur. Explain surprising dependencies on representation details,
coercions, or definitional equality when they affect understanding or robustness.
Prefer a characteristic API lemma when it removes a demonstrated fragile
dependency; do not require one for routine goal restatement.

Review substantial proofs for useful intermediate lemmas and extract reusable
reasoning when its benefit justifies the new interface. Add comments explaining
mathematical stages where the script leaves them unclear. Proof length can guide
inspection, but no line-count threshold establishes a defect. Inspect short
proofs too for unexplained, context-dependent unfolding.

Check unnecessary hypotheses, unjustified `revert`/context manipulation, global
option changes, and unexplained heartbeat or recursion-depth increases when
they obstruct understanding or create a maintenance/performance burden. Search
for the underlying fact or a better decomposition before raising limits.
Measure expensive automation under comparable conditions when making a speed
claim; a timeout without context does not identify its cause.

For a finding, give the located pattern, its actual maintenance consequence,
proposed replacement or extraction, and affected consumers. Acceptance preserves
the original claim, builds the consumers, and demonstrates the
specific clarity, reuse, or measured performance improvement. A shorter proof
alone is insufficient. Proof-only changes retain their statement; planned
assumption reductions follow [generality](generality.md) and the generalized-
theorem preservation check rather than freezing unnecessary assumptions.
