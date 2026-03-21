# Shared Baseline Profile

This repository uses profiles as a repo convention, not as a native Codex runtime feature.

Every serious delivery profile starts with the same cross-cutting baseline. The active baseline is intentionally small so day-to-day delegation stays clear.

The active baseline is defined in [profile.sh](profile.sh) and is applied by [`scripts/activate-profile.sh`](../../scripts/activate-profile.sh).

## Baseline Agents

- `security-auditor`: reviews code and configuration for concrete security weaknesses
- `code-reviewer`: the default code-audit and maintainability review role for this repo
- `qa-expert`: plans validation depth, test coverage, and release confidence

## Optional Supporting Roles

These roles are still useful, but they are not part of the default active set in `.codex/agents/`:

- `product-manager`: bring in when scope, prioritization, or product tradeoffs need explicit attention
- `tooling-engineer`: bring in when formatting, linting, static analysis, CI, or workflow automation needs direct ownership

## Quality Gate Expectations

Every profile built on this baseline should expect the following checks to exist and be respected where available:

- formatting must pass
- linting or static analysis must pass
- tests must pass
- security findings must be addressed according to repo policy
- SonarQube or equivalent quality-gate feedback must be reviewed where configured

The exact commands can vary by technology, but the baseline expectation is stable across profiles even when `tooling-engineer` is only used on demand.
