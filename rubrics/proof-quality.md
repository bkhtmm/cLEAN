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

Default to stable automation available in the pinned environment when it
replaces fragile sequences of individual rewrites. Short explicit arguments
remain appropriate. When retaining a long calculation instead of automation,
explain its concrete advantage in clarity, stability, or measured cost. Avoid
dependence on incidental unfolding or unrelated global rules.

In new or rewritten proofs, first seek an explicit rewrite or characteristic
API lemma before using `change` or `show`. If either is retained, include a brief
comment explaining why the alternatives are unsuitable. Flag accidental
definitional equality across wrappers or coercions and require an explicit
interface lemma where needed.

A proof exceeding 50 lines should trigger a review for useful intermediate
lemmas. Extract substantial reusable reasoning. When keeping the argument
together is justified, add comments explaining its mathematical stages wherever
the script leaves them unclear. Inspect short proofs too for unexplained,
context-dependent unfolding.

Check unnecessary hypotheses, unjustified `revert`/context manipulation, global
option changes, and unexplained heartbeat or recursion-depth increases when
they obstruct understanding or create a maintenance/performance burden. Search
for the underlying fact or a better decomposition before raising limits.
Measure expensive automation under comparable conditions when making a speed
claim; a timeout without context does not identify its cause.

For a finding, give the located pattern, its actual maintenance consequence,
proposed replacement or extraction, and affected consumers. Acceptance preserves
the statement and assumptions, builds the consumers, and demonstrates the
specific clarity, reuse, or measured performance improvement. A shorter proof
alone is insufficient.
