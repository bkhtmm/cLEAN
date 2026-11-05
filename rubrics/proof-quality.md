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

Prefer automation where it makes the proof stable and legible. Use only tactics
available in the pinned environment. `simp`, `grind`, `omega`, explicit `rw`,
structured `calc`, and direct term proofs each have appropriate uses. Broad
automation can also depend on global instances, unexpected unfolding, or costly
search; an explicit short argument can be clearer and faster. Do not replace a
readable calculation merely because automation can close it, or mandate
`simp only`/unrestricted `simp` for every proof.

Inspect accidental definitional equality across abstraction boundaries. A
consumer repeatedly unfolding an implementation may indicate missing API; show
the characteristic lemma that would protect it. `change`, `show`, `rfl`,
`simpa`, and coercion management are legitimate tools. Report a concrete fragility
or obscured mathematical step rather than banning those tokens or requiring a
comment for every use.

Long proofs can need intermediate lemmas or an explanation of their mathematical
stages. Do not impose a universal line limit; a coherent induction may be easier
to understand in one proof. A three-line proof can still be brittle if it
succeeds through unexplained context-sensitive unfolding.

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
