# AI Foundation

## Use Codex CLI In The Dev Container

This repository includes a development container in [`.devcontainer/devcontainer.json`](.devcontainer/devcontainer.json). When the container is created, it installs the OpenAI Codex CLI with `npm install -g @openai/codex`. Each time the container starts, it prepares `https://github.com/VoltAgent/awesome-codex-subagents.git` directly inside the workspace at `$CODEX_SUBAGENTS_DIR`.

### 1. Open the project in the dev container

Use any editor that supports Dev Containers, then open this repository in the container.

Common flows:

- VS Code: `Dev Containers: Reopen in Container`
- Cursor: reopen the folder in the dev container

The container uses Ubuntu 24.04 and Node.js 22.

### 2. Wait for the container setup to finish

The container uses two lifecycle steps:

```bash
postCreateCommand: /bin/bash .devcontainer/scripts/post-create.sh
```

```bash
postStartCommand: /bin/bash .devcontainer/scripts/post-start.sh
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

You can verify the install inside the container:

```bash
codex --version
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

## References

- [Codex CLI docs](https://developers.openai.com/codex/cli)
- [OpenAI Codex repository](https://github.com/openai/codex)
