#!/usr/bin/env bash
# check.sh - verify all tools are installed

MISSING=()

ok()      { printf "  %-18s %-10s %s\n" "$1" "ok"      "$2"; }
missing() { printf "  %-18s %-10s\n"    "$1" "missing";      }

check() {
    local cmd="$1" label="${2:-$1}" version="$3"
    if command -v "$cmd" &>/dev/null; then
        ok "$label" "$version"
    else
        missing "$label"
        MISSING+=("$label")
    fi
}

# ── header ───────────────────────────────────────────────────────────────────
printf "\n  %-18s %-10s %s\n" "tool" "status" "version"
printf "  %s\n" "──────────────────────────────────────────────────"

# ── linux essentials ─────────────────────────────────────────────────────────
check curl    "curl"        "$(curl --version 2>/dev/null | head -1 | awk '{print $2}')"
check wget    "wget"        "$(wget --version 2>/dev/null | head -1 | awk '{print $3}')"
check ssh     "ssh"         "$(ssh -V 2>&1 | grep -oP 'OpenSSH_[\d.p]+')"
check rsync   "rsync"       "$(rsync --version 2>/dev/null | head -1 | awk '{print $3}')"
check make    "make"        "$(make --version 2>/dev/null | head -1 | awk '{print $3}')"
check tar     "tar"         "$(tar --version 2>/dev/null | head -1 | awk '{print $4}')"
check gzip    "gzip"        "$(gzip --version 2>/dev/null | head -1 | awk '{print $2}')"
check zip     "zip"         "$(zip --version 2>&1 | awk '/This is/{print $4}')"
check unzip   "unzip"       "$(unzip -v 2>/dev/null | head -1 | awk '{print $2}')"
check openssl "openssl"     "$(openssl version 2>/dev/null | awk '{print $2}')"
check gpg     "gpg"         "$(gpg --version 2>/dev/null | head -1 | awk '{print $3}')"

# ── git ──────────────────────────────────────────────────────────────────────
check git       "git"       "$(git --version 2>/dev/null | awk '{print $3}')"
check lazygit   "lazygit"   "$(lazygit --version 2>/dev/null | grep -oP '(?<=version=)[^,\s]+' | head -1)"
check gh        "gh"        "$(gh --version 2>/dev/null | head -1 | awk '{print $3}')"
check delta     "delta"     "$(delta --version 2>/dev/null | awk '{print $2}')"

# ── editors / IDEs ───────────────────────────────────────────────────────────
check nvim    "neovim"      "$(nvim --version 2>/dev/null | head -1 | awk '{print $2}')"
check code    "vscode"      "$(code --version 2>/dev/null | head -1)"

# ── languages ────────────────────────────────────────────────────────────────
check go      "golang"      "$(go version 2>/dev/null | awk '{print $3}')"
check lua     "lua"         "$(lua -v 2>&1 | awk '{print $2}')"
check python3 "python"      "$(python3 --version 2>/dev/null | awk '{print $2}')"
check pip3    "pip"         "$(pip3 --version 2>/dev/null | awk '{print $2}')"
check php     "php"         "$(php --version 2>/dev/null | head -1 | awk '{print $2}')"
check rustc   "rust"        "$(rustc --version 2>/dev/null | awk '{print $2}')"
check cargo   "cargo"       "$(cargo --version 2>/dev/null | awk '{print $2}')"
check gcc     "gcc"         "$(gcc --version 2>/dev/null | head -1 | awk '{print $3}')"
check cmake   "cmake"       "$(cmake --version 2>/dev/null | head -1 | awk '{print $3}')"
check java    "java"        "$(java -version 2>&1 | head -1 | sed 's/.*version "\(.*\)".*/\1/')"
check sqlite3 "sqlite"      "$(sqlite3 --version 2>/dev/null | awk '{print $1}')"
check node    "node"        "$(node --version 2>/dev/null)"
check npm     "npm"         "$(npm --version 2>/dev/null)"
check yarn    "yarn"        "$(yarn --version 2>/dev/null)"
check pnpm    "pnpm"        "$(pnpm --version 2>/dev/null)"
check bun     "bun"         "$(bun --version 2>/dev/null)"
# nvm is a shell function — check for the script directly
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
    _nvm_ver=$(bash -c '. "$HOME/.nvm/nvm.sh" && nvm --version' 2>/dev/null)
    ok "nvm" "$_nvm_ver"
else
    missing "nvm"
    MISSING+=("nvm")
fi

# ── cloud / infra ─────────────────────────────────────────────────────────────
check aws         "aws-cli"    "$(aws --version 2>/dev/null | awk '{print $1}' | cut -d/ -f2)"
check terraform   "terraform"  "$(terraform version 2>/dev/null | head -1 | awk '{print $2}')"
check ansible     "ansible"    "$(ansible --version 2>/dev/null | head -1 | awk '{print $2}')"

# ── devops / containers ──────────────────────────────────────────────────────
check docker      "docker"      "$(docker --version 2>/dev/null | awk '{print $3}' | tr -d ',')"
check kubectl     "kubectl"     "$(kubectl version --client 2>/dev/null | grep 'Client Version' | awk '{print $3}')"
check minikube    "minikube"    "$(minikube version 2>/dev/null | awk '{print $3}')"
check k9s         "k9s"         "$(k9s version --short 2>/dev/null | awk '/Version/{print $2}')"
check lazydocker  "lazydocker"  "$(lazydocker -v 2>/dev/null | awk '/Version/{print $2}')"
check k6          "k6"          "$(k6 version 2>/dev/null | awk '{print $2}')"

# ── shell / prompt ───────────────────────────────────────────────────────────
check starship  "starship"  "$(starship --version 2>/dev/null | head -1 | awk '{print $2}')"
check tmux      "tmux"      "$(tmux -V 2>/dev/null | awk '{print $2}')"
check fzf       "fzf"       "$(fzf --version 2>/dev/null | awk '{print $1}')"
check zoxide    "zoxide"    "$(zoxide --version 2>/dev/null | awk '{print $2}')"

# ── modern cli ───────────────────────────────────────────────────────────────
check eza       "eza"       "$(eza --version 2>/dev/null | grep -oP 'v\d+\.\d+\.\d+' | head -1)"
check bat       "bat"       "$(bat --version 2>/dev/null | awk '{print $2}')"
check rg        "ripgrep"   "$(rg --version 2>/dev/null | head -1 | awk '{print $2}')"
check fd        "fd"        "$(fd --version 2>/dev/null | awk '{print $2}')"
check jq        "jq"        "$(jq --version 2>/dev/null)"
check yq        "yq"        "$(yq --version 2>/dev/null | awk '{print $NF}')"
check btop      "btop"      "$(btop --version 2>/dev/null | head -1 | sed 's/\x1b\[[0-9;]*m//g' | awk '{print $3}')"
check dust      "dust"      "$(dust --version 2>/dev/null | awk '{print $2}')"
check duf       "duf"       "$(duf --version 2>/dev/null | grep -oP '\d+\.\d+\.\d+' || echo 'source')"
check procs     "procs"     "$(procs --version 2>/dev/null | awk '{print $2}')"

# ── misc ─────────────────────────────────────────────────────────────────────
check yazi      "yazi"      "$(yazi --version 2>/dev/null | awk '{print $2}')"
check wl-copy   "wl-copy"   ""
check just      "just"      "$(just --version 2>/dev/null | awk '{print $2}')"
check yt-dlp    "yt-dlp"    "$(yt-dlp --version 2>/dev/null)"
check fastfetch "fastfetch" "$(fastfetch --version 2>/dev/null | awk '{print $2}')"
check tldr      "tldr"      "$(tldr --version 2>/dev/null | head -1 | awk '{print $2}')"
check ffmpeg    "ffmpeg"    "$(ffmpeg -version 2>/dev/null | head -1 | awk '{print $3}')"
check vlc       "vlc"       "$(vlc --version 2>/dev/null | head -1 | awk '{print $3}')"

# ── neovim deps ──────────────────────────────────────────────────────────────
check luarocks    "luarocks"    "$(luarocks --version 2>/dev/null | head -1 | awk '{print $2}')"
check tree-sitter "tree-sitter" "$(tree-sitter --version 2>/dev/null | awk '{print $2}')"
check magick      "imagemagick" "$(magick --version 2>/dev/null | head -1 | awk '{print $3}')"
check pdflatex    "pdflatex"    "$(pdflatex --version 2>/dev/null | head -1 | grep -oP '\d+\.\d+\S+')"
check mmdc        "mmdc"        "$(mmdc --version 2>/dev/null)"
check gio         "gio"         "$(gio --version 2>/dev/null | head -1 | awk '{print $NF}')"
# ghostscript: gs is aliased to 'git status' in .bashrc — check the real binary
if command -v ghostscript &>/dev/null; then
    ok "ghostscript" "$(ghostscript --version 2>/dev/null)"
elif /usr/bin/gs --version &>/dev/null 2>&1; then
    ok "ghostscript" "$(/usr/bin/gs --version 2>/dev/null)"
else
    missing "ghostscript"
    MISSING+=("ghostscript")
fi

# ── summary ──────────────────────────────────────────────────────────────────
echo
if [[ ${#MISSING[@]} -eq 0 ]]; then
    echo "  all tools installed"
else
    echo "  missing (${#MISSING[@]}): ${MISSING[*]}"
    exit 1
fi
