# cLEAN

An agent skill for turning an existing Lean 4 formalization into a mathematical
library that is easier to understand, maintain, and reuse.

cLEAN audits a repository, designs a dependency-aware cleanup, applies bounded
refactors, and checks the result. It supports a single agent or an authorized
team of agents. It is a set of instructions and handoff formats, not a new proof
assistant or a hosted orchestration service.

**Status:** version `4`, with individual theorem review and measured cleanup
reports. The workflow is ready for pilots; it is not a claim of demonstrated
autonomous reliability on large libraries.

## Use it

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

Example requests, replacing paths and limits with your own:

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

## Select bounded or campaign mode

Choose the mode in your request. Bounded mode is the default for a finite task:

```text
Use $clean to refactor Algebra/Orders and its affected consumers.
```

For repeated discovery across a larger scope, select campaign mode explicitly:

```text
Use $clean in campaign mode on /path/to/formalization.
Audit, refactor, and verify the whole repository for reuse and maintainability.
Keep the mathematical claims and pinned dependencies intact. Track coverage,
discover further work after each batch, and perform a closure review before
declaring completion. Save progress under /path/to/run-records. Use up to
8 hours; if work remains when that limit is reached, leave a resumable checkpoint.
```

The example's time allocation is optional and user-selected. Campaign mode keeps
the original scope and permissions. You can also request a campaign audit or
plan without authorizing source edits. Merely naming the whole repository does
not select campaign mode.

The agent reads the selector in [SKILL.md](SKILL.md#choose-persistence), follows
[the campaign workflow](workflows/campaign.md), and records its choice in the
run state. For example:

```yaml
operation: refactor
mode: campaign
scope: whole repository
current_batch: T-006
next_action: inspect remaining AnalyticSpace consumers
```

This is an illustrative progress record, not a configuration file you must
prepare. In a later request, say "Resume this cLEAN campaign using the run record
at /path/to/run-records." The agent retains the selected mode and checks that
the saved state still matches the repository before continuing. The host agent's
runtime determines automatic continuation; the skill adds no new UI switch or
background service.

Campaign mode repeats discovery and verified batches until its coverage and
closure conditions are met, or saves incomplete progress at a limit/blocker.
It does not require edits when review finds the existing code already useful.

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
| [campaign](workflows/campaign.md) | Optional discovery loop, coverage, closure, and resumable checkpoints |
| [report](workflows/report.md) | Flexible result explanations, visual selection, and links to supporting evidence |
| [rubrics](rubrics/_common.md) | Shared evidence rules and quality angles, including build health, linked from the entry point |
| [records](references/records.md) | Portable run, finding, task, check, and handoff formats |
| [design](docs/design.md) | Research sources, adaptations, and architecture choices |
| [agents/openai.yaml](agents/openai.yaml) | Optional UI metadata; the workflow itself is agent-neutral |

## Validation and next pilots

The draft has been tried on small Lean-only examples. Large Mathlib repositories,
multi-agent campaigns, and automatic continuation across runtime turns still
need testing before relying on large autonomous campaigns.
The research sources and their reviewed versions are recorded in `docs/design.md`.

## License

[MIT](LICENSE). Research sources and design influences are credited in
[the design record](docs/design.md).
