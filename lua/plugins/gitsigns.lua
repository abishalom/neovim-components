require("gitsigns").setup({
  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("]h", gitsigns.next_hunk, "Next Git hunk")
    map("[h", gitsigns.prev_hunk, "Previous Git hunk")
    map("<leader>hp", gitsigns.preview_hunk, "Preview Git hunk")
    map("<leader>hr", gitsigns.reset_hunk, "Reset Git hunk")
  end,
})
