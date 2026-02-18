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
| `yt-dlp`               | Video downloader       |
| `wl-copy` / `wl-paste` | Wayland clipboard      |

### Language Runtimes & Package Managers

| Tool             | Purpose                      |
| ---------------- | ---------------------------- |
| `nvm`            | Node.js version manager      |
| `node` / `npm`   | Node.js runtime              |
| `pnpm`           | Fast Node.js package manager |
| `yarn`           | Node.js package manager      |
| `bun`            | JavaScript runtime & toolkit |
| `go`             | Go toolchain                 |
| `rust` / `cargo` | Rust toolchain               |
| `python3` / `pip`| Python                       |
| `lua`            | Lua runtime                  |
| `java 21`        | JDK                          |
| `gcc` / `cmake`  | C/C++ toolchain              |

### Cloud & Infrastructure

| Tool        | Purpose                    |
| ----------- | -------------------------- |
| `aws`       | AWS CLI                    |
| `terraform` | Infrastructure as code     |
| `ansible`   | Configuration management   |
| `docker`    | Containers                 |
| `kubectl`   | Kubernetes CLI             |
| `minikube`  | Local Kubernetes           |
| `k6`        | Load testing               |

---

## Installation

```bash
git clone https://github.com/dilkhush/dotfiles ~/dotfiles
cd ~/dotfiles
bash link.sh
```

`link.sh` checks that all required tools (`git`, `nvim`, `starship`, `tmux`, `bash`) are installed before proceeding. Creates symlinks:

```
~/.bashrc                        → bash/.bashrc
~/.gitconfig                     → git/.gitconfig
~/.config/starship.toml          → starship/starship.toml
~/.config/tmux/tmux.conf         → tmux/.tmux.conf
~/.config/nvim                   → nvim/
~/.config/kitty/kitty.conf       → kitty/kitty.conf
```

To verify all tools are installed:

```bash
bash check.sh
```

```
  tool               status     version
  ──────────────────────────────────────────────────
  curl               ok         8.15.0
  wget               ok         2.2.1
  git                ok         2.53.0
  neovim             ok         v0.11.6
  golang             ok         go1.25.7
  python             ok         3.14.2
  node               ok         v24.13.0
  aws-cli            ok         2.33.2
  terraform          ok         v1.14.5
  ansible            missing
  ...

  missing (1): ansible
```

Exits `0` when all tools are present, `1` if anything is missing.

---

## Shell Aliases

### Navigation

| Alias     | Command              | Description                    |
| --------- | -------------------- | ------------------------------ |
| `z <dir>` | `zoxide`             | Jump to a directory (smart)    |
| `zi`      | `zoxide interactive` | Interactively pick a directory |
| `..`      | `cd ..`              | Go up one level                |
| `...`     | `cd ../..`           | Go up two levels               |

### Files & Search

| Alias  | Command                  | Description                        |
| ------ | ------------------------ | ---------------------------------- |
| `ls`   | `eza --icons`            | List files with icons              |
| `ll`   | `eza -lah --icons --git` | Long listing with git info         |
| `la`   | `eza -a --icons`         | List all files                     |
| `tree` | `eza --tree`             | Tree view                          |
| `cat`  | `bat`                    | View file with syntax highlighting |
| `grep` | `rg`                     | Ripgrep                            |
| `find` | `fd`                     | Fast file finder                   |

### System

| Alias     | Command     | Description                      |
| --------- | ----------- | -------------------------------- |
| `top`     | `btop`      | Process monitor                  |
| `du`      | `dust`      | Disk usage                       |
| `df`      | `duf`       | Disk free                        |
| `ps`      | `procs`     | Process list                     |
| `mkdir`   | `mkdir -pv` | Create dirs with parents         |
| `sysinfo` | `fastfetch` | System information               |
| `path`    | —           | Print `$PATH` one entry per line |

### Git

| Alias | Command                                | Description     |
| ----- | -------------------------------------- | --------------- |
| `g`   | `git`                                  | Git shorthand   |
| `lg`  | `lazygit`                              | Terminal git UI |
| `gs`  | `git status`                           | Status          |
| `gd`  | `git diff`                             | Diff            |
| `gl`  | `git log --oneline --graph --decorate` | Pretty log      |

### Docker & Kubernetes

| Alias | Command                 | Description            |
| ----- | ----------------------- | ---------------------- |
| `d`   | `docker`                | Docker shorthand       |
| `dc`  | `docker compose`        | Docker Compose         |
| `ld`  | `lazydocker`            | Docker terminal UI     |
| `dps` | `docker ps` (formatted) | Running containers     |
| `k`   | `kubectl`               | Kubernetes CLI         |
| `mk`  | `minikube`              | Minikube               |
| `k9`  | `k9s`                   | Kubernetes terminal UI |

### Misc

| Alias        | Command             | Description                    |
| ------------ | ------------------- | ------------------------------ |
| `vim` / `vi` | `nvim`              | Neovim                         |
| `j`          | `just`              | Run justfile tasks             |
| `jq`         | `jq --color-output` | JSON with color                |
| `ydl`        | `yt-dlp`            | Download video                 |
| `tldr`       | `tldr --color`      | Colored help pages             |
| `copy`       | `wl-copy`           | Copy to clipboard (Wayland)    |
| `paste`      | `wl-paste`          | Paste from clipboard (Wayland) |
| `python`     | `python3`           | Python 3                       |
| `pip`        | `pip3`              | pip 3                          |

---

## FZF

| Binding   | Action                          |
| --------- | ------------------------------- |
| `Ctrl+R`  | Fuzzy search shell history      |
| `↑` / `↓` | Search history backward/forward |

**Default options**: `--height 40% --reverse`
**Default command**: `fd --type f --hidden --follow --exclude .git`

---

## Shell History

| Setting          | Value                                                     |
| ---------------- | --------------------------------------------------------- |
| `HISTSIZE`       | 10 000 entries in memory                                  |
| `HISTFILESIZE`   | 20 000 entries on disk                                    |
| `HISTCONTROL`    | Ignore duplicates and blank lines, erase older duplicates |
| `HISTTIMEFORMAT` | `%F %T` timestamp on each entry                           |
| `histappend`     | Sessions append rather than overwrite `~/.bash_history`   |

---

## Tmux

Prefix: `C-b` (default).
Config lives at `~/.config/tmux/tmux.conf`.

### Session commands (shell)

| Command     | Action                                              |
| ----------- | --------------------------------------------------- |
| `ta [name]` | Attach to session by name, or create it if missing  |
| `tn [name]` | New named session (default: current directory name) |
| `tl`        | List all sessions                                   |
| `tk`        | Kill current session                                |
| `tka`       | Kill all sessions + tmux server                     |
| `tz`        | Toggle zoom current pane                            |

### Keybindings

All bindings use the prefix (`C-b`) unless noted.

| Key                  | Action                           |
| -------------------- | -------------------------------- |
| `prefix + r`         | Reload config                    |
| `prefix + S`         | Pick session interactively       |
| `prefix + X`         | Kill current session (confirm)   |
| `prefix + c`         | New window (current path)        |
| `prefix + x`         | Kill pane (confirm)              |
| `prefix + ,`         | Rename window                    |
| `prefix + \|`        | Split vertical (current path)    |
| `prefix + -`         | Split horizontal (current path)  |
| `prefix + h/j/k/l`   | Navigate panes (vim-style)       |
| `prefix + z`         | Toggle zoom current pane         |
| `prefix + H/J/K/L`   | Resize pane (step 5, repeatable) |
| `prefix + Enter`     | Enter copy mode                  |
| `v` (copy mode)      | Begin selection                  |
| `C-v` (copy mode)    | Rectangle selection toggle       |
| `y` (copy mode)      | Copy selection and exit          |
| `q` (copy mode)      | Cancel                           |

### Plugins

| Plugin              | Purpose                         |
| ------------------- | ------------------------------- |
| `tpm`               | Plugin manager                  |
| `tmux-sensible`     | Sensible defaults               |
| `tmux-resurrect`    | Save and restore sessions       |
| `tmux-continuum`    | Auto-save sessions every 15 min |

> Install TPM: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
> Then inside tmux press `C-b I` to install plugins.

---

## Neovim

Built on [LazyVim](https://lazyvim.org) using [lazy.nvim](https://github.com/folke/lazy.nvim).

### Key Mappings

| Key          | Mode   | Action                            |
| ------------ | ------ | --------------------------------- |
| `<C-x>`      | Visual | Cut selection to system clipboard |
| `<C-x>`      | Normal | Cut current line to clipboard     |
| `<leader>dd` | Normal | Open Lazydocker                   |

> Default LazyVim leader key is `<Space>`.

### Language Support

| Language                | Features                                   |
| ----------------------- | ------------------------------------------ |
| C / C++                 | clangd LSP, clangd extensions, CMake tools |
| Python                  | LSP, Black formatter, venv selector        |
| TypeScript / JavaScript | LSP, Tailwind CSS                          |
| Go                      | LSP                                        |
| Rust                    | LSP                                        |
| SQL                     | LSP, DaDBod database client                |
| Docker                  | LSP                                        |
| Elixir                  | LSP                                        |
| YAML / TOML / JSON      | LSP with schema validation                 |
| Prisma                  | Schema support                             |
| Typst                   | LSP, preview                               |

### Selected Plugins

| Plugin                          | Purpose                    |
| ------------------------------- | -------------------------- |
| `tokyonight.nvim`               | Color theme (transparent)  |
| `blink.cmp`                     | Completion engine          |
| `nvim-treesitter`               | Syntax parsing             |
| `nvim-lspconfig` + `mason.nvim` | LSP management             |
| `conform.nvim`                  | Code formatting            |
| `nvim-lint`                     | Linting                    |
| `flash.nvim`                    | Fast navigation            |
| `mini.files`                    | File browser               |
| `mini.surround`                 | Surround text objects      |
| `mini.ai`                       | Extended text objects      |
| `yanky.nvim`                    | Enhanced yank/paste        |
| `gitsigns.nvim`                 | Git signs in gutter        |
| `lazydocker.nvim`               | Docker UI inside Neovim    |
| `toggleterm.nvim`               | Integrated terminal        |
| `trouble.nvim`                  | Diagnostics panel          |
| `todo-comments.nvim`            | Highlight TODOs            |
| `which-key.nvim`                | Keybinding help popup      |
| `noice.nvim`                    | Improved UI notifications  |
| `grug-far.nvim`                 | Find & replace             |
| `vim-dadbod` + UI               | Database client            |
| `cord.nvim`                     | Discord rich presence      |
| `persistence.nvim`              | Session management         |
| `dial.nvim`                     | Increment/decrement values |
| `typst-preview.nvim`            | Typst preview              |
| `venv-selector.nvim`            | Python venv picker         |

---

## Kitty

GPU-accelerated terminal with Tokyo Night colors and JetBrains Mono font.

### Appearance

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

### Keybindings

| Key                    | Action                              |
| ---------------------- | ----------------------------------- |
| `Ctrl+Shift+C`         | Copy to clipboard                   |
| `Ctrl+Shift+V`         | Paste from clipboard                |
| `Ctrl+Shift+T`         | New tab (same cwd)                  |
| `Ctrl+Shift+Q`         | Close tab                           |
| `Ctrl+Tab`             | Next tab                            |
| `Ctrl+Shift+Tab`       | Previous tab                        |
| `Ctrl+Shift+Enter`     | Split horizontal (same cwd)         |
| `Ctrl+Shift+A`         | Split vertical (same cwd)           |
| `Ctrl+Shift+W`         | Close split                         |
| `Alt+H/J/K/L`          | Focus left/down/up/right            |
| `Ctrl+Alt+H/J/K/L`     | Resize narrower/shorter/taller/wider|
| `Ctrl+Shift+N`         | Launch Neovim (same cwd)            |
| `Ctrl+Shift+R`         | Reload config                       |
| `Ctrl+Shift+K`         | Clear terminal + scrollback         |
| `Ctrl+Shift+D`         | Show scrollback in pager            |

---

## Git Configuration

| Setting             | Value         |
| ------------------- | ------------- |
| Default branch      | `main`        |
| Editor              | `nvim`        |
| Diff pager          | `delta`       |
| Pull strategy       | rebase        |
| Auto setup remote   | yes           |
| CRLF handling       | `input`       |
| Moved lines in diff | zebra-colored |

### Git Aliases

| Alias     | Command                                      | Description            |
| --------- | -------------------------------------------- | ---------------------- |
| `st`      | `git status`                                 | Status shorthand       |
| `lg`      | `git log --oneline --graph --decorate --all` | Graph log all branches |
| `undo`    | `git reset --soft HEAD~1`                    | Undo last commit       |
| `aliases` | `git config --get-regexp alias`              | List all aliases       |

---

## Starship Prompt

```
[user@host] 📁 ~/projects/foo 🌿 main [!1] ⏱ 3s  bash
❯
```

| Segment          | Style                                        |
| ---------------- | -------------------------------------------- |
| Username         | Bold blue                                    |
| Hostname         | Bold yellow                                  |
| Directory        | Bold cyan, max 3 levels deep                 |
| Git branch       | Purple                                       |
| Git status       | Bold red — shows `+`, `!`, `?`, ahead/behind |
| Command duration | Bold yellow — shown when cmd takes > 2s      |
| Shell indicator  | Cyan bold (`bash:`, `fish: 󰈺`, `zsh: `)      |
| Success prompt   | Cyan + green `❯`                             |
| Error prompt     | Cyan + red `❯`                               |

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
├── link.sh
└── readme.md
```
