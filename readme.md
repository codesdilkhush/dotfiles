# dotfiles

Personal dotfiles for a Neovim-centric development environment with modern CLI tools.

---

## Requirements

### Core

| Tool       | Purpose              |
| ---------- | -------------------- |
| `bash`     | Shell                |
| `neovim`   | Editor               |
| `kitty`    | Terminal emulator    |
| `starship` | Prompt               |
| `git`      | Version control      |
| `tmux`     | Terminal multiplexer |

### Modern CLI Replacements

| Tool             | Replaces  | Purpose                              |
| ---------------- | --------- | ------------------------------------ |
| `eza`            | `ls`      | File listing with icons and git info |
| `bat`            | `cat`     | Syntax-highlighted file viewer       |
| `ripgrep` (`rg`) | `grep`    | Fast content search                  |
| `fd`             | `find`    | Fast file search                     |
| `zoxide`         | `cd`      | Smart directory jumping              |
| `fzf`            | —         | Fuzzy finder                         |
| `btop`           | `top`     | Process monitor                      |
| `dust`           | `du`      | Disk usage                           |
| `duf`            | `df`      | Disk free                            |
| `procs`          | `ps`      | Process listing                      |
| `delta`          | git pager | Enhanced git diffs                   |
| `jq`             | —         | JSON processor                       |
| `yq`             | —         | YAML processor                       |

### Development

| Tool                   | Purpose                |
| ---------------------- | ---------------------- |
| `lazygit`              | Terminal UI for git    |
| `lazydocker`           | Terminal UI for Docker |
| `gh`                   | GitHub CLI             |
| `just`                 | Command runner         |
| `k9s`                  | Kubernetes terminal UI |
| `yazi`                 | Terminal file manager  |
| `tldr`                 | Simplified man pages   |
| `fastfetch`            | System info            |
| `ffmpeg`               | Media processing       |
| `yt-dlp`               | Video downloader       |
| `wl-copy` / `wl-paste` | Wayland clipboard      |

### Language Runtimes & Package Managers

| Tool              | Purpose                      |
| ----------------- | ---------------------------- |
| `nvm`             | Node.js version manager      |
| `node` / `npm`    | Node.js runtime              |
| `pnpm`            | Fast Node.js package manager |
| `yarn`            | Node.js package manager      |
| `bun`             | JavaScript runtime & toolkit |
| `go`              | Go toolchain                 |
| `rust` / `cargo`  | Rust toolchain               |
| `python3` / `pip` | Python                       |
| `lua`             | Lua runtime                  |
| `java 21`         | JDK                          |
| `gcc` / `cmake`   | C/C++ toolchain              |

### Cloud & Infrastructure

| Tool        | Purpose                  |
| ----------- | ------------------------ |
| `aws`       | AWS CLI                  |
| `terraform` | Infrastructure as code   |
| `ansible`   | Configuration management |
| `docker`    | Containers               |
| `kubectl`   | Kubernetes CLI           |
| `minikube`  | Local Kubernetes         |
| `k6`        | Load testing             |

---

## Installation

```bash
git clone https://github.com/dilkhush/dotfiles ~/dotfiles
cd ~/dotfiles
bash link.sh
```

`link.sh` checks that all required tools (`git`, `nvim`, `starship`, `tmux`, `bash`) are installed before proceeding. Creates symlinks:

```
~/.bashrc                  → bash/.bashrc
~/.gitconfig               → git/.gitconfig
~/.config/starship.toml    → starship/starship.toml
~/.config/tmux/tmux.conf   → tmux/.tmux.conf
~/.config/nvim             → nvim/
~/.config/kitty/kitty.conf → kitty/kitty.conf
~/.local/bin/dotfiles      → help.sh
```

To verify all tools are installed:

```bash
bash check.sh
```

For an offline reference of all shortcuts and aliases:

```bash
dotfiles --help          # all sections
dotfiles tmux            # tmux only
dotfiles git             # git only
# sections: shell  tmux  kitty  nvim  git  fzf
```

---

## Neovim

Built on [LazyVim](https://lazyvim.org) using [lazy.nvim](https://github.com/folke/lazy.nvim).

**Custom mappings** (leader = `Space`):

| Key          | Mode   | Action                            |
| ------------ | ------ | --------------------------------- |
| `<C-x>`      | Visual | Cut selection to system clipboard |
| `<C-x>`      | Normal | Cut current line to clipboard     |
| `<leader>dd` | Normal | Open Lazydocker                   |

**Languages**: C/C++, Python, TypeScript/JavaScript, Go, Rust, SQL, Docker, Elixir, YAML/TOML/JSON, Prisma, Typst.

---

## Kitty

GPU-accelerated terminal with Tokyo Night colors and JetBrains Mono font.

| Setting            | Value               |
| ------------------ | ------------------- |
| Font               | JetBrains Mono 12pt |
| Theme              | Tokyo Night         |
| Opacity            | 90% (dynamic)       |
| Background blur    | 20                  |
| Padding            | 12px                |
| Window decorations | Hidden              |
| Tab bar            | Disabled            |
| Scrollback         | 50 000 lines        |

---

## Tmux

Prefix: `C-b`. Config: `~/.config/tmux/tmux.conf`.

Plugins: `tpm`, `tmux-sensible`, `tmux-resurrect`, `tmux-continuum` (auto-save every 15 min).

> Install TPM: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
> Then inside tmux: `C-b I`

---

## Git

| Setting             | Value         |
| ------------------- | ------------- |
| Default branch      | `main`        |
| Editor              | `nvim`        |
| Diff pager          | `delta`       |
| Pull strategy       | rebase        |
| Auto setup remote   | yes           |
| CRLF handling       | `input`       |
| Moved lines in diff | zebra-colored |

---

## Structure

```
dotfiles/
├── bash/
│   └── .bashrc
├── git/
│   └── .gitconfig
├── kitty/
│   └── kitty.conf
├── nvim/
│   ├── init.lua
│   ├── lua/
│   │   ├── config/
│   │   │   ├── keymaps.lua
│   │   │   └── lazy.lua
│   │   └── plugins/
│   │       ├── discord.lua
│   │       ├── lazydocker.lua
│   │       └── theme.lua
│   └── lazyvim.json
├── starship/
│   └── starship.toml
├── tmux/
│   └── .tmux.conf
├── check.sh
├── help.sh
├── link.sh
└── readme.md
```
