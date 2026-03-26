# AI Foundation

AI Foundation is a Codex-ready foundation repository for working inside dev containers with a small, explicit agent baseline. It gives you multiple environment options and profile-based agent activation so the active setup matches the stack you are working on.

## Quick Start

1. Open this repository in one of the devcontainers listed below.
2. Wait for container startup to finish.
3. From the repository root, run:

```bash
codex
```

4. If Codex prompts for sign-in, complete the browser-based flow and return to the terminal when authentication finishes.
5. If you want a different profile than the one currently active, switch it manually with:

```bash
./scripts/activate-profile.sh <profile-name>
```

All containers share the same `postCreateCommand`, and the profile-specific containers run their own `postStartCommand` wrappers. The setup also prepares `awesome-codex-subagents` automatically and forwards port `1455` for the Codex auth callback flow.

Useful verification commands inside the container:

```bash
codex --version
dotnet --info   # C# container
node --version  # React fullstack container
```

## Best Practices

- Start a new Codex thread for each distinct task to keep context focused and token use efficient.
- Begin with a clear goal, relevant file paths, and any important constraints or preferences.
- Use planning before implementation for non-trivial, cross-cutting, or higher-risk changes.
- Keep requests bounded so verification and handoff stay easy to understand.
- Ask Codex to run the smallest relevant verification for the change.
- When a non-trivial task is done, create a committed handoff note with `$create-summary`.

## Choose Your Setup

| Use this when | Devcontainer | Includes | Profile behavior |
| --- | --- | --- | --- |
| You want the default general-purpose Codex environment | [`.devcontainer/devcontainer.json`](.devcontainer/devcontainer.json) | Ubuntu 24.04 and Node.js 22 | No profile auto-activation |
| You are working on a modern `.NET` service | [`.devcontainer/csharp/devcontainer.json`](.devcontainer/csharp/devcontainer.json) | Node.js 22, latest LTS `.NET` SDK, and C# editor support | Auto-activates `dotnet-service` unless another profile is already active |
| You are working on a Next.js and TypeScript fullstack app | [`.devcontainer/react-fullstack/devcontainer.json`](.devcontainer/react-fullstack/devcontainer.json) | Node.js 22 and common React editor extensions for ESLint, Prettier, and Tailwind CSS | Auto-activates `react-fullstack` unless another profile is already active |

You can open the repository in any editor that supports Dev Containers, including VS Code, Cursor, and GitHub Codespaces.

## Profiles

Profiles are a repo convention that combine the right devcontainer, the right project-local agents, and optional future skills.

Available profiles:

- `dotnet-service`
- `react-fullstack`

To activate a profile manually and sync the active agents into [`.codex/agents/`](.codex/agents), run:

```bash
./scripts/activate-profile.sh dotnet-service
./scripts/activate-profile.sh react-fullstack
```

To list available profiles, run:

```bash
./scripts/activate-profile.sh --list
```

Task handoff notes:

- Store committed per-task thread summaries in [docs/task-summaries/](docs/task-summaries/)
- Use the template at [docs/task-summaries/_template.md](docs/task-summaries/_template.md)
- Name files as `YYYY-MM-DD-short-task-name.md`
- Use `$create-summary` to create a new summary for a completed non-trivial task

More detail:

- [profiles/_baseline/README.md](profiles/_baseline/README.md)
- [profiles/dotnet-service/README.md](profiles/dotnet-service/README.md)
- [profiles/react-fullstack/README.md](profiles/react-fullstack/README.md)

## References

- [Codex CLI docs](https://developers.openai.com/codex/cli)
- [OpenAI Codex repository](https://github.com/openai/codex)
