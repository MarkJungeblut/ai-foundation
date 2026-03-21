#!/bin/bash

set -euo pipefail

target="${CODEX_SUBAGENTS_DIR:-$(pwd)/awesome-codex-subagents}"

if [ -d "$target/.git" ]; then
  git -C "$target" pull --ff-only
else
  mkdir -p "$(dirname "$target")"
  git clone https://github.com/VoltAgent/awesome-codex-subagents.git "$target"
fi
