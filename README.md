# AI Foundation

## Use The Dev Containers

This repository includes two development container configurations:

- [`.devcontainer/devcontainer.json`](.devcontainer/devcontainer.json) for the default general-purpose setup
- [`.devcontainer/csharp/devcontainer.json`](.devcontainer/csharp/devcontainer.json) for C# development with the .NET SDK and C# editor support
- [`.devcontainer/react-fullstack/devcontainer.json`](.devcontainer/react-fullstack/devcontainer.json) for Next.js-based React fullstack development with Node.js 22

All containers share the same create-time setup. On startup, the default container runs the shared startup script, while the C# and React fullstack containers run profile-specific startup wrappers that also activate their matching profiles when appropriate. All of them still prepare `https://github.com/VoltAgent/awesome-codex-subagents.git` directly inside the workspace at `$CODEX_SUBAGENTS_DIR`.

### 1. Open the project in the dev container

Use any editor that supports Dev Containers, then open this repository in the container.

Common flows:

- VS Code: `Dev Containers: Reopen in Container` for the default environment
- VS Code: choose the C# configuration when prompted if you want the .NET-focused environment
- VS Code: choose the React fullstack configuration when prompted if you want the Next.js-focused environment
- Cursor: reopen the folder in the dev container and choose the matching configuration if prompted
- GitHub Codespaces: create a new codespace and select the C# or React fullstack devcontainer configuration when you want a profile-specific environment

The default container uses Ubuntu 24.04 and Node.js 22. The C# container adds the official `.NET` devcontainer feature with the latest LTS SDK, while keeping Node.js 22 and the same Codex workflow. The React fullstack container keeps Node.js 22 and adds editor extensions for ESLint, Prettier, and Tailwind CSS.

### 2. Wait for the container setup to finish

The containers use the same create-time step:

```bash
postCreateCommand: /bin/bash .devcontainer/scripts/post-create.sh
```

The default container uses:

```bash
postStartCommand: /bin/bash .devcontainer/scripts/post-start.sh
```

The C# container uses:

```bash
postStartCommand: /bin/bash .devcontainer/csharp/post-start.sh
```

The React fullstack container uses:

```bash
postStartCommand: /bin/bash .devcontainer/react-fullstack/post-start.sh
```

By default, the cloned repo lives at:

```bash
$CODEX_SUBAGENTS_DIR
```

That resolves to `./awesome-codex-subagents` in the workspace. It is easy to browse from the dev container and is ignored by this repository's Git config.

The startup setup includes:

```bash
/bin/bash .devcontainer/scripts/post-create.sh
```

```bash
/bin/bash .devcontainer/scripts/post-start.sh
```

In the C# container, startup also runs:

```bash
/bin/bash .devcontainer/csharp/post-start.sh
```

In the React fullstack container, startup also runs:

```bash
/bin/bash .devcontainer/react-fullstack/post-start.sh
```

You can verify the install inside the container:

```bash
codex --version
```

In the C# container, you can also verify the .NET SDK:

```bash
dotnet --info
```

In the React fullstack container, you can verify Node.js tooling:

```bash
node --version
```

### 3. Start Codex

From a terminal inside the dev container, run:

```bash
codex
```

According to the official Codex CLI docs, the first time you run Codex you will be prompted to sign in, and you can authenticate with either your ChatGPT account or an API key.

### 4. Complete authentication

The dev container forwards port `1455`, labeled `Codex auth callback`, to support the browser-based sign-in flow from inside the container.

If Codex opens a browser-based login flow:

- keep the dev container running
- follow the sign-in prompt from your local browser
- return to the terminal once authentication completes

### 5. Work with Codex in this repo

Run Codex from the repository root so it can inspect and modify the files in this workspace:

```bash
codex
```

Then give it tasks in plain language, for example:

```text
Add a test for the authentication flow
```

```text
Explain the project structure
```

```text
Create a Dockerfile for this service
```

If you are using the C# container, you can also use the built-in .NET tooling and C# editor extensions for general C# development.

The C# container also auto-activates the `dotnet-service` profile unless you have intentionally switched to a different active profile already.

If you are using the React fullstack container, you can use the Node.js setup and frontend-focused editor extensions for Next.js and TypeScript development.

The React fullstack container also auto-activates the `react-fullstack` profile unless you have intentionally switched to a different active profile already.

## References

- [Codex CLI docs](https://developers.openai.com/codex/cli)
- [OpenAI Codex repository](https://github.com/openai/codex)

## Profiles

This repository also includes repo-level profile documentation:

- [profiles/_baseline/README.md](profiles/_baseline/README.md) for the shared delivery baseline
- [profiles/dotnet-service/README.md](profiles/dotnet-service/README.md) for the `.NET` service profile
- [profiles/react-fullstack/README.md](profiles/react-fullstack/README.md) for the Next.js-based React fullstack profile

Profiles are a repo convention that combine the right devcontainer, the right project-local agents, and optional future skills.

To activate a profile and sync the correct active agents into [`.codex/agents/`](.codex/agents), run:

```bash
./scripts/activate-profile.sh dotnet-service
```

```bash
./scripts/activate-profile.sh react-fullstack
```

To list available profiles, run:

```bash
./scripts/activate-profile.sh --list
```
