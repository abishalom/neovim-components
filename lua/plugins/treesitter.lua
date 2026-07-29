local treesitter = require("nvim-treesitter")

local parsers = {
  "python",
  "markdown",
  "markdown_inline",
  "yaml",
  "dockerfile",
  "typescript",
  "tsx",
  "svelte",
  "lua",
  "vim",
  "vimdoc",
}

vim.api.nvim_create_user_command("TSInstallConfigured", function()
  treesitter.install(parsers)
end, { desc = "Install configured Tree-sitter parsers" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "python",
    "markdown",
    "yaml",
    "dockerfile",
    "typescript",
    "typescriptreact",
    "svelte",
    "lua",
    "vim",
  },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
