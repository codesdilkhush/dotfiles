# ~/.bashrc

# system
[[ -f /etc/bashrc ]] && . /etc/bashrc

# path helper - skips duplicates and missing dirs
path_prepend() { [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"; }

path_prepend "$HOME/.local/bin"
path_prepend "$HOME/bin"
path_prepend "/usr/local/bin"

# java
if [[ -d /usr/lib/jvm/java-21-openjdk ]]; then
    export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
    path_prepend "$JAVA_HOME/bin"
fi

# go
export GOROOT="$HOME/.go"
export GOPATH="$HOME/go"
path_prepend "$GOROOT/bin"
path_prepend "$GOPATH/bin"

# rust
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# nvm - lazy load (avoids ~300ms startup cost)
export NVM_DIR="$HOME/.nvm"
_nvm_load() {
    unset -f nvm node npm npx pnpm
    # shellcheck source=/dev/null
    [[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"
    # shellcheck source=/dev/null
    [[ -s "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"
}
nvm()   { _nvm_load; nvm "$@"; }
node()  { _nvm_load; node "$@"; }
npm()   { _nvm_load; npm "$@"; }
npx()   { _nvm_load; npx "$@"; }

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
path_prepend "$PNPM_HOME"
pnpm()  { _nvm_load; pnpm "$@"; }

# bun
export BUN_INSTALL="$HOME/.bun"
path_prepend "$BUN_INSTALL/bin"

# php / herd lite
export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
path_prepend "$HOME/.config/herd-lite/bin"

# asdf - shims last = highest priority
export ASDF_DIR="$HOME/.asdf"
path_prepend "$ASDF_DIR/bin"
path_prepend "$ASDF_DIR/shims"

# opencode
path_prepend "$HOME/.opencode/bin"

# history
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%F %T  "
shopt -s histappend

# prompt
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
else
    PS1='[\u@\h \W]\$ '
fi

# completions
[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# gh completions - cached to avoid subprocess cost on every shell open
if command -v gh &>/dev/null; then
    _GH_COMP="$HOME/.cache/gh-completion.bash"
    if [[ ! -f "$_GH_COMP" || "$_GH_COMP" -ot "$(command -v gh)" ]]; then
        mkdir -p "$HOME/.cache"
        gh completion -s bash > "$_GH_COMP" 2>/dev/null
    fi
    [[ -f "$_GH_COMP" ]] && . "$_GH_COMP"
    unset _GH_COMP
fi

# fzf
export FZF_DEFAULT_OPTS='--height 40% --reverse'
command -v fd &>/dev/null && export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# viewer defaults
export BAT_THEME="Coldark-Dark"
export LESS="-R --use-color"

# zoxide - replaces cd
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
    alias cd='z'
    alias cdi='zi'
else
    alias cdi='cd'
fi

# key bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
if command -v fzf &>/dev/null; then
    bind -x '"\C-r": "READLINE_LINE=$(history | fzf --tac --reverse | sed s/^[[:space:]]*[0-9]*[[:space:]]*//); READLINE_POINT=${#READLINE_LINE}"'
else
    bind '"\C-r": reverse-search-history'
fi

# ls - prefer eza
if command -v eza &>/dev/null; then
    alias ls='eza --icons=auto'
    alias ll='eza -alh --icons=auto --git --group-directories-first'
    alias la='eza -a --icons=auto'
    alias tree='eza --tree --icons=auto'
else
    alias ls='ls --color=auto'
    alias ll='ls -alh --color=auto'
    alias la='ls -A --color=auto'
    alias tree='find . -print | sed "s;[^/]*/;|____;g;s;____|; |;g"'
fi

alias ..='cd ..'
alias ...='cd ../..'

# cat - prefer bat
if command -v bat &>/dev/null; then
    alias cat='bat --paging=auto'
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# modern replacements
command -v rg    &>/dev/null && alias grep='rg'
command -v fd    &>/dev/null && alias find='fd'
command -v btop  &>/dev/null && alias top='btop'
command -v dust  &>/dev/null && alias du='dust'   || alias du='du -h'
command -v duf   &>/dev/null && alias df='duf'    || alias df='df -h'
command -v procs &>/dev/null && alias ps='procs'
command -v delta &>/dev/null && export GIT_PAGER='delta'

# editor - prefer nvim
if command -v nvim &>/dev/null; then
    export EDITOR='nvim'
    alias vim='nvim'
    alias vi='nvim'
else
    export EDITOR='nano'
fi

# yazi - file manager with cwd on exit
if command -v yazi &>/dev/null; then
    yz() {
        local tmp cwd
        tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [[ -n "$cwd" ]] && [[ "$cwd" != "$PWD" ]]; then
            cd -- "$cwd" || return
        fi
        rm -f -- "$tmp"
    }
fi

# clipboard (wayland)
if command -v wl-copy &>/dev/null; then
    alias copy='wl-copy'
    alias paste='wl-paste'
fi

# git
alias g='git'
alias lg='lazygit'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'

# docker
alias d='docker'
alias dc='docker compose'
alias ld='lazydocker'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'

# kubernetes
alias k='kubectl'
alias mk='minikube'
alias k9='k9s'

# misc
alias j='just'
alias jq='jq --color-output'
alias mkdir='mkdir -pv'
alias tldr='tldr --color'
alias ydl='yt-dlp'
alias sysinfo='fastfetch'
alias path='echo $PATH | tr ":" "\n"'

# python
alias python='python3'
alias pip='pip3'

# tmux
alias tl='tmux list-sessions'                    # list sessions
alias tk='tmux kill-session'                     # kill current session
alias tka='tmux kill-server'                     # kill all sessions + server
alias tz='tmux resize-pane -Z'                   # toggle zoom current pane

# attach to session by name, or create it
ta() {
    if [[ -z "$1" ]]; then
        tmux attach 2>/dev/null || tmux new-session
    else
        tmux attach -t "$1" 2>/dev/null || tmux new-session -s "$1"
    fi
}

# open new named session (default: basename of cwd)
tn() {
    local name="${1:-$(basename "$PWD")}"
    tmux new-session -s "$name"
}
