# Neovim configuration

A minimal personal Neovim 0.12 configuration using Neovim's built-in `vim.pack` package manager.

## Included

- Catppuccin Mocha theme
- `mini.pick` for file and text search; `mini.files` for file browsing
- Git hunk signs and actions via Gitsigns
- Tree-sitter parsers for Python, Markdown, YAML, Dockerfiles, TypeScript, and Svelte
- LSP support for Basedpyright, Ruff, and TypeScript
- Ruff safe fixes and formatting on Python saves

## Prerequisites

- Neovim 0.12+
- Git
- A C compiler and a compatible `tree-sitter` CLI for parser installation. On this Ubuntu 22.04 machine: `npm install -g tree-sitter-cli@0.25.10`
- `basedpyright`, `ruff`, and `typescript-language-server` available on `PATH`
- A project-local `typescript` dependency for TypeScript/Svelte projects (standard in SvelteKit projects)

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
