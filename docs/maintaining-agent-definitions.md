# Maintaining Agent Definitions

The active profiles in this repository vendor only the agent TOMLs they require.

When you want to refresh one of those definitions from an upstream catalog:

1. Review the upstream TOML you want to adopt.
2. Copy the updated content into the matching profile-owned file under `profiles/**/agents/`.
3. Review the diff before committing so instruction or model changes are intentional.
4. Re-run profile activation for the affected profiles to confirm the generated `.codex/agents/` output still matches expectations.

Do not add runtime clone or pull steps back into devcontainer startup. Treat upstream catalogs as a manual source of reviewed updates, not a boot-time dependency.
