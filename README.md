# Neovim configuration

A minimal personal Neovim 0.12 configuration using Neovim's built-in `vim.pack` package manager.

## Included

- Catppuccin Mocha theme
- `mini.pick` for file and text search; `mini.files` for file browsing
- WhichKey for dynamic keybinding hints and built-in Vim motion help
- `blink.cmp` for LSP, buffer, path, and snippet completion
- Git hunk signs and actions via Gitsigns
- Tree-sitter parsers for Python, Markdown, YAML, Dockerfiles, TypeScript, and Svelte
- LSP support for Basedpyright, Ruff, and TypeScript
- Ruff safe fixes and formatting on Python saves

## Prerequisites

- Neovim 0.12+
- Git
- A C compiler, Rust/Cargo, and Tree-sitter CLI 0.26.1+ for parser installation. On this Ubuntu 22.04 machine: `cargo install tree-sitter-cli --version 0.26.13 --locked` (the `nvim-treesitter` plugin recommends installing the CLI via Cargo, not npm)
- `basedpyright`, `ruff`, and `typescript-language-server` available on `PATH`
- A project-local `typescript` dependency for TypeScript/Svelte projects (standard in SvelteKit projects)

## Clipboard

`NVIM_CLIPBOARD` selects the clipboard provider (default: `auto`):

| Value | Behavior |
| --- | --- |
| `auto` | OSC 52 over SSH; Windows clipboard on WSL; otherwise Neovim's native provider detection |
| `osc52` | Copy/paste through terminal OSC 52 escape sequences |
| `wsl` | Use `clip.exe` and `powershell.exe` |
| `native` | Let Neovim detect the system clipboard utility |

Override for one invocation, or export it in your shell configuration:

```sh
NVIM_CLIPBOARD=osc52 nvim
# For a local Linux desktop:
export NVIM_CLIPBOARD=native
```

Local Linux desktops need `wl-clipboard` (Wayland) or `xclip`/`xsel` (X11).
OSC 52 requires support in your local terminal; clipboard reads/paste queries
are often blocked or unsupported. Use your terminal's paste shortcut in that
case. WSL requires Windows interoperability and its clipboard commands on `PATH`.
Normal yanks/pastes use the selected provider via `unnamedplus`.

## Keymaps

`<leader>` is Space.

| Mapping | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Search project text |
| `<leader>e` | Browse files |
| `<leader>f` | Format buffer |
| `gd` | Go to definition |
| `K` | Hover documentation |
| `]h` / `[h` | Next / previous Git hunk |
| `<leader>hp` | Preview Git hunk |
| `<leader>hr` | Reset Git hunk |

Neovim's built-in LSP mappings include `grn` (rename), `gra` (code action), and `grr` (references).

## Plugin management

Plugin revisions are recorded in `nvim-pack-lock.json`; commit this file. To review and update plugins, run:

```vim
:lua vim.pack.update()
```

Write the review buffer to accept its proposed updates, or quit it to discard them.

Install the configured Tree-sitter parsers on a new machine, or after updating the Tree-sitter plugin, with:

```vim
:TSInstallConfigured
```
