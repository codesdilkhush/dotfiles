#!/bin/bash

DOTFILES="$HOME/dotfiles"

# ── check required tools before linking ──────────────────────────────────────
REQUIRED=(git nvim starship tmux bash)
MISSING=()

for tool in "${REQUIRED[@]}"; do
    if ! command -v "$tool" &>/dev/null; then
        MISSING+=("$tool")
    fi
done

if [[ ${#MISSING[@]} -gt 0 ]]; then
    echo "error: missing required tools: ${MISSING[*]}"
    echo "install them first, then re-run link.sh"
    echo "run check.sh to see full dependency status"
    exit 1
fi

# ── create dirs ──────────────────────────────────────────────────────────────
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/kitty"
mkdir -p "$HOME/.config/tmux"
mkdir -p "$HOME/.local/bin"

# ── symlinks ─────────────────────────────────────────────────────────────────
ln -sf "$DOTFILES/bash/.bashrc"              "$HOME/.bashrc"
ln -sf "$DOTFILES/git/.gitconfig"            "$HOME/.gitconfig"
ln -sf "$DOTFILES/starship/starship.toml"    "$HOME/.config/starship.toml"
ln -sf "$DOTFILES/tmux/.tmux.conf"           "$HOME/.config/tmux/tmux.conf"
ln -sf "$DOTFILES/nvim"                      "$HOME/.config/nvim"
ln -sf "$DOTFILES/kitty/kitty.conf"          "$HOME/.config/kitty/kitty.conf"
ln -sf "$DOTFILES/help.sh"                   "$HOME/.local/bin/dotfiles"
chmod +x "$DOTFILES/help.sh"

echo "dotfiles linked"
