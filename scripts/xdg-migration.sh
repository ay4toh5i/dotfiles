#!/bin/bash
set -euo pipefail

if [[ -z "${XDG_CONFIG_HOME:-}" || -z "${XDG_DATA_HOME:-}" ]]; then
    echo "Error: XDG_CONFIG_HOME and XDG_DATA_HOME must be set"
    exit 1
fi

migrate() {
    local src="$1"
    local dest="$2"
    local name="$3"

    if [[ ! -e "$src" ]]; then
        return
    fi

    if [[ -e "$dest" ]]; then
        echo "[SKIP] $name: destination already exists ($dest)"
        return
    fi

    mkdir -p "$(dirname "$dest")"
    mv "$src" "$dest"
    echo "[OK] $name: $src -> $dest"
}

echo "XDG Base Directory Migration"
echo "============================="
echo ""

# Data directories
migrate "$HOME/.cargo" "$XDG_DATA_HOME/cargo" "CARGO_HOME"
migrate "$HOME/.rustup" "$XDG_DATA_HOME/rustup" "RUSTUP_HOME"
migrate "$HOME/go" "$XDG_DATA_HOME/go" "GOPATH"
migrate "$HOME/.gnupg" "$XDG_DATA_HOME/gnupg" "GNUPGHOME"
migrate "$HOME/.gradle" "$XDG_DATA_HOME/gradle" "GRADLE_USER_HOME"
migrate "$HOME/.node_repl_history" "$XDG_DATA_HOME/node_repl_history" "NODE_REPL_HISTORY"

# Config directories
migrate "$HOME/.claude" "$XDG_CONFIG_HOME/claude" "CLAUDE_CONFIG_DIR"
migrate "$HOME/.docker" "$XDG_CONFIG_HOME/docker" "DOCKER_CONFIG"
migrate "$HOME/.npmrc" "$XDG_CONFIG_HOME/npm/npmrc" "NPM_CONFIG_USERCONFIG"

echo ""
echo "Done."
