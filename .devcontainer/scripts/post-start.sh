#!/bin/bash

set -euo pipefail

# `pwd` prints the absolute path after changing into the script directory.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/../.." && pwd)"

mkdir -p "$repo_root/.codex/agents"
