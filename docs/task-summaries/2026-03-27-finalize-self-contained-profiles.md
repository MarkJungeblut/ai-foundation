# Task Summary

## Goal

Finish hardening the profile setup so active profiles are self-contained, do not rely on a runtime checkout of an external subagent catalog, and keep `.codex` runtime state local instead of committed.

## Changes Made

- Vendored the required active-agent TOMLs into profile-owned `agents/` folders and updated profile definitions to copy from those local files
- Removed devcontainer startup checkout logic and the unused `CODEX_SUBAGENTS_DIR` configuration
- Converted `.codex/ACTIVE_PROFILE` and `.codex/agents/*.toml` into generated local state with `.gitkeep` placeholders
- Updated README and profile docs to describe the self-contained model and added a maintainer note for manual agent-definition refreshes
- Deleted the unused local `awesome-codex-subagents/` checkout and removed its stale ignore rule

## Files Touched

- `.devcontainer/devcontainer.json`
- `.devcontainer/csharp/devcontainer.json`
- `.devcontainer/react-fullstack/devcontainer.json`
- `.devcontainer/scripts/post-start.sh`
- `.gitignore`
- `README.md`
- `profiles/_baseline/profile.sh`
- `profiles/_baseline/agents/security-auditor.toml`
- `profiles/_baseline/agents/code-reviewer.toml`
- `profiles/_baseline/agents/qa-expert.toml`
- `profiles/react-fullstack/profile.sh`
- `profiles/react-fullstack/agents/nextjs-developer.toml`
- `profiles/dotnet-service/profile.sh`
- `profiles/dotnet-service/agents/dotnet-core-expert.toml`
- `docs/maintaining-agent-definitions.md`

## Decisions

- Vendor only the active-profile agent TOMLs the repo depends on instead of keeping a runtime dependency on the upstream catalog
- Treat `.codex` as machine-local generated state and stop committing copied active-agent files or the active profile marker
- Keep upstream agent catalogs as a manual refresh source that is reviewed into git, not a startup dependency

## Follow-Ups

- If full offline bootstrap becomes important later, evaluate replacing the `npm install -g @openai/codex` post-create dependency with a more reproducible install path
