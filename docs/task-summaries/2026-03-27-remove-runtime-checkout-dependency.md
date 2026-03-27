# Task Summary

## Goal

Remove the runtime dependency on `awesome-codex-subagents` so advertised profiles stay self-contained and resilient if the upstream catalog becomes unavailable. Make generated `.codex` profile state local-only instead of committed repo state.

## Changes Made

- Vendored the required active-profile agent TOMLs into profile-owned `agents/` folders and repointed profile definitions at those local files.
- Removed devcontainer startup checkout logic and the unused `CODEX_SUBAGENTS_DIR` wiring.
- Deleted the now-unused local `awesome-codex-subagents/` checkout and removed its stale ignore rule.
- Converted `.codex/ACTIVE_PROFILE` and `.codex/agents/*.toml` into ignored generated runtime state and added `.gitkeep` placeholders for directory shape.
- Updated README/profile docs with the self-contained profile model and added a maintainer note for manually refreshing vendored agent definitions.
- Marked the shell entrypoint scripts executable so the documented `./scripts/activate-profile.sh ...` flow works from a fresh clone.

## Files Touched

- `.devcontainer/devcontainer.json`
- `.devcontainer/csharp/devcontainer.json`
- `.devcontainer/react-fullstack/devcontainer.json`
- `.devcontainer/scripts/post-start.sh`
- `.gitignore`
- `README.md`
- `profiles/_baseline/profile.sh`
- `profiles/_baseline/README.md`
- `profiles/_baseline/agents/security-auditor.toml`
- `profiles/_baseline/agents/code-reviewer.toml`
- `profiles/_baseline/agents/qa-expert.toml`
- `profiles/react-fullstack/profile.sh`
- `profiles/react-fullstack/README.md`
- `profiles/react-fullstack/agents/nextjs-developer.toml`
- `profiles/dotnet-service/profile.sh`
- `profiles/dotnet-service/README.md`
- `profiles/dotnet-service/agents/dotnet-core-expert.toml`
- `docs/maintaining-agent-definitions.md`
- `.codex/.gitkeep`
- `.codex/agents/.gitkeep`

## Decisions

- Vendor only the currently required agent TOMLs instead of mirroring the full upstream catalog.
- Keep `.codex` as machine-local generated runtime state and stop committing active profile markers and copied active-agent files.
- Treat upstream agent catalogs as a manual refresh source reviewed into git, not a boot-time dependency.

## Follow-Ups

- If full offline bootstrap becomes important, separately evaluate replacing the `npm install -g @openai/codex` post-create dependency with a more reproducible install path.
