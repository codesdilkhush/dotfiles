#!/usr/bin/env bash
# help.sh - offline reference for all dotfile shortcuts and aliases
# Usage: dotfiles --help  OR  bash ~/dotfiles/help.sh [section]

BOLD="\e[1m"
CYAN="\e[36m"
YELLOW="\e[33m"
GREEN="\e[32m"
DIM="\e[2m"
RESET="\e[0m"

header() { printf "\n${BOLD}${CYAN}  %-s${RESET}\n" "$1"; printf "  ${DIM}%s${RESET}\n" "$(printf '─%.0s' {1..50})"; }
row()    { printf "  ${GREEN}%-22s${RESET}  %s\n" "$1" "$2"; }
kv()     { printf "  ${YELLOW}%-22s${RESET}  %s\n" "$1" "$2"; }
note()   { printf "  ${DIM}%s${RESET}\n" "$1"; }

# ── sections ─────────────────────────────────────────────────────────────────
show_shell() {
    header "SHELL ALIASES — navigation"
    row "z <dir>"       "smart jump to directory (zoxide)"
    row "zi"            "interactive directory picker"
    row ".."            "cd .."
    row "..."           "cd ../.."

    header "SHELL ALIASES — files"
    row "ls"            "eza --icons"
    row "ll"            "eza -lah --icons --git"
    row "la"            "eza -a --icons"
    row "tree"          "eza --tree"
    row "cat"           "bat (syntax highlighting)"
    row "grep"          "ripgrep (rg)"
    row "find"          "fd"

    header "SHELL ALIASES — system"
    row "top"           "btop"
    row "du"            "dust"
    row "df"            "duf"
    row "ps"            "procs"
    row "mkdir"         "mkdir -pv (with parents)"
    row "sysinfo"       "fastfetch"
    row "path"          "print \$PATH one entry per line"
    row "python"        "python3"
    row "pip"           "pip3"

    header "SHELL ALIASES — git"
    row "g"             "git"
    row "gs"            "git status"
    row "gd"            "git diff"
    row "gl"            "git log --oneline --graph --decorate"
    row "lg"            "lazygit (terminal UI)"

    header "SHELL ALIASES — docker / k8s"
    row "d"             "docker"
    row "dc"            "docker compose"
    row "dps"           "docker ps (formatted)"
    row "ld"            "lazydocker"
    row "k"             "kubectl"
    row "mk"            "minikube"
    row "k9"            "k9s"

    header "SHELL ALIASES — misc"
    row "vim / vi"      "nvim"
    row "j"             "just (run justfile tasks)"
    row "jq"            "jq --color-output"
    row "ydl"           "yt-dlp"
    row "tldr"          "tldr --color"
    row "copy"          "wl-copy (clipboard)"
    row "paste"         "wl-paste (clipboard)"
}

show_tmux() {
    header "TMUX — session (shell commands)"
    row "ta [name]"      "attach to session, or create it (default: last)"
    row "tn [name]"      "new named session (default: current dir name)"
    row "tl"             "list all sessions"
    row "tk"             "kill current session"
    row "tka"            "kill ALL sessions + tmux server"
    row "tz"             "toggle zoom current pane"

    header "TMUX — keybindings  (prefix = C-b)"
    note "all bindings require prefix unless noted"
    row "prefix + r"          "reload config"
    row "prefix + S"          "pick session interactively"
    row "prefix + X"          "kill current session (with confirm)"
    row "prefix + c"          "new window (current path)"
    row "prefix + x"          "kill pane (with confirm)"
    row "prefix + ,"          "rename window"
    row "prefix + |"          "split vertical (current path)"
    row "prefix + -"          "split horizontal (current path)"
    row "prefix + h/j/k/l"    "navigate panes (vim-style)"
    row "prefix + z"          "toggle zoom current pane"
    row "prefix + H/J/K/L"    "resize pane (step 5, repeatable)"
    row "prefix + Enter"      "enter copy mode"
    note "copy mode (vi keys):"
    row "  v"                 "begin selection"
    row "  C-v"               "rectangle selection toggle"
    row "  y"                 "copy + exit"
    row "  q"                 "cancel"
    note "plugins: tmux-resurrect (save/restore) · tmux-continuum (auto-save 15m)"
    note "install TPM: git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
    note "install plugins inside tmux: prefix + I"
}

show_kitty() {
    header "KITTY"
    row "Ctrl+Shift+C"        "copy to clipboard"
    row "Ctrl+Shift+V"        "paste from clipboard"
    row "Ctrl+Shift+T"        "new tab (same cwd)"
    row "Ctrl+Shift+Q"        "close tab"
    row "Ctrl+Tab"            "next tab"
    row "Ctrl+Shift+Tab"      "previous tab"
    row "Ctrl+Shift+Enter"    "split horizontal (same cwd)"
    row "Ctrl+Shift+A"        "split vertical (same cwd)"
    row "Ctrl+Shift+W"        "close split"
    row "Alt+H/J/K/L"         "focus pane left/down/up/right"
    row "Ctrl+Alt+H/J/K/L"    "resize pane narrower/shorter/taller/wider"
    row "Ctrl+Shift+N"        "launch nvim (same cwd)"
    row "Ctrl+Shift+R"        "reload kitty config"
    row "Ctrl+Shift+K"        "clear terminal + scrollback"
    row "Ctrl+Shift+D"        "show scrollback in pager"
}

show_nvim() {
    header "NEOVIM  (leader = Space)"
    note "custom mappings (LazyVim defaults not listed):"
    row "Ctrl+x  (visual)"   "cut selection to system clipboard"
    row "Ctrl+x  (normal)"   "cut line to system clipboard"
    row "<leader>dd"         "open lazydocker"
}

show_git() {
    header "GIT ALIASES  (.gitconfig)"
    kv "git st"         "git status"
    kv "git lg"         "log --oneline --graph --decorate --all"
    kv "git undo"       "reset --soft HEAD~1"
    kv "git aliases"    "list all configured aliases"

    header "GIT SETTINGS"
    kv "pull"           "rebase (no accidental merge commits)"
    kv "push"           "auto setup remote on first push"
    kv "diff"           "delta pager + zebra moved-line colors"
    kv "editor"         "nvim"
}

show_fzf() {
    header "FZF"
    row "Ctrl+R"        "fuzzy search shell history"
    row "↑ / ↓"         "history backward / forward"
    note "default command: fd --type f --hidden --follow --exclude .git"
    note "default options: --height 40% --reverse"
}

show_all() {
    show_shell
    show_tmux
    show_kitty
    show_nvim
    show_git
    show_fzf
    echo
}

# ── dispatch ─────────────────────────────────────────────────────────────────
case "${1:-all}" in
    shell|bash)   show_shell  ;;
    tmux)         show_tmux   ;;
    kitty)        show_kitty  ;;
    nvim|neovim)  show_nvim   ;;
    git)          show_git    ;;
    fzf)          show_fzf    ;;
    all|--help|-h|"") show_all ;;
    *)
        printf "usage: dotfiles --help [section]\n"
        printf "sections: shell  tmux  kitty  nvim  git  fzf\n"
        exit 1
        ;;
esac
