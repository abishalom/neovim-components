local map = vim.keymap.set

map("n", "<leader>ff", function()
  require("mini.pick").builtin.files()
end, { desc = "Find files" })

map("n", "<leader>fg", function()
  require("mini.pick").builtin.grep_live()
end, { desc = "Grep project" })

map("n", "<leader>e", function()
  require("mini.files").open()
end, { desc = "Explore files" })

map("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_format = "never" })
end, { desc = "Format buffer" })

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
