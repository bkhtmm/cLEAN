# cLEAN

**A framework for agent-assisted Lean library engineering.**

cLEAN guides coding agents through auditing and refactoring existing Lean 4
formalizations to make them easier to understand, maintain, and reuse.

The framework combines mathematical review, dependency-aware planning, bounded
refactoring, and verification through the project's Lean toolchain. Its workflows
examine theorem assumptions, opportunities to reuse Mathlib and local results,
public APIs, module structure, proof quality, and documentation.

For broad work, cLEAN establishes repository structure early, after initial
baseline and mathematical discovery. Its [structure workflow](workflows/structure.md)
adapts to both broad libraries and deep, focused projects, then migrates useful
boundaries in verified batches before granular cleanup of affected consumers.
Sound existing organization can be retained without moving files.

cLEAN supports focused repairs and sustained repository cleanup, run by a single
agent or an authorized team. It produces reviewable changes, migration notes,
and evidence of the improvements and checks performed.

**Status:** version `4`, with individual theorem review and measured cleanup
reports. The workflow is ready for pilots; it is not a claim of demonstrated
autonomous reliability on large libraries.

## Installation

cLEAN is distributed as a portable agent skill. Its entry point, `SKILL.md`,
connects the workflows, review rubrics, and evidence and handoff formats. The
framework runs through your existing coding agent and Lean toolchain.

Copy this folder into your agent's skill directory under the name `clean`,
keeping `SKILL.md` and its supporting folders together. Use the installation
mechanism supported by that agent. No cLEAN-specific packages or account are
required. To use it manually, ask the agent to read `SKILL.md` from this folder.

For Codex, install this prerelease for your user:

```sh
mkdir -p "$HOME/.agents/skills"
git clone --depth 1 --branch v4 https://github.com/bkhtmm/cLEAN.git "$HOME/.agents/skills/clean"
```

Use a new chat in your target Lean project and invoke `$clean`. If it does not
appear, restart Codex. This uses the user skill location documented in the
[official Codex skill guide](https://learn.chatgpt.com/docs/build-skills).
The destination must not already contain a different installation; keep the
existing copy if you already have one. Other agents can use the same folder
through their own skill-installation mechanism.

The target repository needs its own Lean toolchain and pinned dependencies for
executable checks. cLEAN can inspect and plan without a working compiler, but
must report unavailable checks and cannot certify an unbuilt repair.

## Example requests

Replace paths and limits in these examples with your own:

```text
Use $clean to audit /path/to/formalization. Do not edit its source.
Focus on reusable APIs and theorem statement dependencies. Save the report
under /path/to/run-records and state which areas were actually inspected.
```

```text
Use $clean to refactor /path/to/formalization for reuse and maintainability.
Keep its Lean and Mathlib revisions fixed and preserve all main results.
Start with a representative foundation and consumer, then continue through
Algebra/Orders and its affected consumers. Apply and verify the changes;
record migration notes and remaining work under /path/to/run-records.
```

```text
Use $clean to turn the audit at /path/to/audit.md into an executable plan.
Include a target module structure, preservation checks, task dependencies,
and a first repair batch. Do not apply the plan yet.
```

```text
Use $clean to verify the current patch against revision BASE.
Check statement/definition preservation, axioms, affected consumers,
and the claimed improvement. Report any unperformed checks explicitly.
```

For a large run, specify the scope and time/compute limits. Agent availability
and delegation permissions come from the host/user, not from this folder. An
authorized cleanup proceeds through audit, plan, repair, and verification;
audit-only and plan-only requests leave target sources unchanged.

## Reuse during cleanup

cLEAN's goal is maintainability while preserving mathematics. Ordinary `$clean`
requests search for Mathlib/local overlap and replace duplicated implementations
where appropriate. Useful wrappers can remain when their mathematical, automation,
or compatibility role justifies their cost; their proofs should reuse existing
mathematics when suitable. Redundant declarations can be deleted with their
consumers migrated.

The [duplication workflow](workflows/inclusive-duplication.md) is part of normal
cleanup. It examines statement overlap even when a proof already delegates to
Mathlib, then applies the same evidence-backed retention and removal rules.
Overlap alone does not require deleting a useful interface.

Numerical duplication evaluation is optional. Request it alongside cleanup when
you need comparable before/after results:

```text
Use $clean to refactor /path/to/formalization for maintainability.
Preserve the main claims and dependency pins. Reuse Mathlib and retain justified
interfaces; verify removed statements and migrate their consumers.
Also use the frozen duplication judge at /path/to/judge to report comparable
before/after counts, rates, and retained overlaps separately from verified repairs.
```

Shortening a proof alone does not remove its statement's duplication flag.
Judge evaluation can be unavailable or noisy, and a lower score alone does not
establish a better library. A useful retained wrapper can remain a known overlap
without being an unresolved maintenance defect. Audit/plan requests still leave
sources unchanged; neither duplication review nor evaluation changes permissions
or the declared scope and resource limits.

## Work to the requested scope

Focused requests complete the named repair and its affected consumers:

```text
Use $clean to refactor Algebra/Orders and its affected consumers.
```

Whole-repository or broad multi-area requests automatically use
[sustained repository work](workflows/campaign.md): repeated discovery, verified
repair batches, coverage tracking, and a closure review. For example:

```text
Use $clean to audit, refactor, and verify the whole repository at
/path/to/formalization for reuse and maintainability.
Keep the mathematical claims and pinned dependencies intact. Track coverage,
discover further work after each batch, and perform a closure review before
declaring completion. Save progress under /path/to/run-records. Use up to
8 hours; if work remains when that limit is reached, leave a resumable checkpoint.
```

The example's time allocation is optional and user-selected. State the scope,
requested operation, and resource limits; no mode keyword or setting is needed.
Audit-only and plan-only requests still leave target sources unchanged.

The agent follows [the scope instructions](SKILL.md#work-to-the-requested-scope)
and records coverage, progress, and the next action. For example:

```yaml
operation: refactor
scope: whole repository
current_batch: T-006
next_action: inspect remaining AnalyticSpace consumers
```

This is an illustrative progress record, not a configuration file you must
prepare. In a later request, say "Resume this cLEAN cleanup using the run record
at /path/to/run-records." The agent checks the recorded operation, scope, resource
limits, and saved state against the repository before continuing. The host agent's
runtime determines automatic continuation; the skill adds no new UI switch or
background service.

Repository work continues until the declared coverage and closure conditions are
met, or saves incomplete progress at a resource limit or a blocker that prevents
further in-scope work.
Review need not produce edits when the existing code is already useful.

## What you receive

- An evidence-backed mathematical/dependency map and findings with stable IDs.
- A plan with justified module boundaries, consumer migrations, and acceptance
  conditions; for repair requests, the corresponding reviewable patch.
- Check results tied to the actual candidate, preservation evidence for affected
  claims, migration notes, and an honest account of unfinished work.
- Individual assumption/reuse review outcomes for every in-scope theorem in a
  broad audit or cleanup, with new helpers, migrations, and coverage gaps tracked.
- Numerical coverage and verified improvement totals, including whole hypotheses
  removed and Mathlib replacements, plus available before/after Lean source-size
  and organization measurements. Each total links to its supporting records.
- A proportionate explanation of the result, with consumer examples and selected
  visuals when useful. The report format follows the work and your preferences.

cLEAN allows useful breaking changes by default with internal migrations and
clear old-to-new mappings. Explicit project compatibility requirements take
precedence. It does not silently change theorem meanings, add trusted assumptions,
upgrade dependencies, or turn a local cleanup into an upstream submission.

## Guide to the files

| Location | Purpose |
| --- | --- |
| [SKILL.md](SKILL.md) | Agent entry point, workflow routing, and invariants |
| [workflows](workflows/audit.md) | Audit, planning, repair, verification, and optional coordination |
| [structure](workflows/structure.md) | Early layout design scaled to the repository, with Lean-aware moves, splits, and migrations |
| [repository work](workflows/campaign.md) | Discovery, coverage, closure, and resumable checkpoints for whole-repository or broad multi-area requests |
| [report](workflows/report.md) | Flexible result explanations, visual selection, and links to supporting evidence |
| [rubrics](rubrics/_common.md) | Shared evidence rules and quality angles, including build health, linked from the entry point |
| [Mathlib naming conventions](references/mathlib-naming-conventions.md) | Full upstream naming guide with source revision and retrieval date; read when checking names through the discoverability rubric |
| [records](references/records.md) | Portable run, finding, task, check, and handoff formats |
| [agents/openai.yaml](agents/openai.yaml) | Optional UI metadata; the workflow itself is agent-neutral |

## Validation and next pilots

The draft has been tried on small Lean-only examples. Large Mathlib repositories,
multi-agent cleanup, and automatic continuation across runtime turns still
need testing before relying on large autonomous repository cleanups.

## Acknowledgments

cLEAN's mathematical review criteria are adapted from
[TauCetiReview](https://github.com/TauCetiProject/TauCetiReview/tree/main/rubrics).
Its workflows apply those criteria to auditing, planning, refactoring, migrating,
and verifying existing Lean repositories.

The bundled [Mathlib naming guide](references/mathlib-naming-conventions.md)
comes directly from [mathlib-landing](https://github.com/leanprover-community/mathlib-landing),
with its source revision and retrieval date recorded in the file and its
[upstream MIT notice](references/mathlib-naming-LICENSE) retained alongside it.

## License

[MIT](LICENSE).
