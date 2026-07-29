vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/nvim-mini/mini.nvim", name = "mini.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" },
  { src = "https://github.com/stevearc/conform.nvim", name = "conform.nvim" },
})

require("plugins.catppuccin")
require("plugins.mini")
require("plugins.gitsigns")
require("plugins.treesitter")
require("plugins.conform")
