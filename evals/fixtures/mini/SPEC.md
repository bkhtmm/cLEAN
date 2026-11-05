# Mini specification

`Mini.double n` denotes `n + n`. Keep its public zero simplification API usable
with `by simp` without unfolding `double`. `Mini.main` is the advertised sample
result and must remain derivable with its existing quantified claim.

This small project uses Lean core only. The toolchain is pinned and there are no
external dependencies. No separate external compatibility contract is imposed.
The example file is a real fixture consumer, not evidence about a production
repository. Ordinary refactoring must add no proof holes or trusted assumptions.
