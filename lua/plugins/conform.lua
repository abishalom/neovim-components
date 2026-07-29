require("conform").setup({
  formatters_by_ft = {
    python = { "ruff_fix", "ruff_format" },
  },
  format_on_save = function(bufnr)
    if vim.bo[bufnr].filetype == "python" then
      return { timeout_ms = 1000, lsp_format = "never" }
    end
  end,
})
