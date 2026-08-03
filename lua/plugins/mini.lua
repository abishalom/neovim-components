require("mini.pick").setup()
require("mini.files").setup()
require("mini.comment").setup()
require("mini.move").setup()

for mode, move in pairs({ n = "move_line", x = "move_selection" }) do
  for direction, key in pairs({
    up = "<M-Up>",
    down = "<M-Down>",
    left = "<M-Left>",
    right = "<M-Right>",
  }) do
    vim.keymap.set(mode, key, function()
      MiniMove[move](direction)
    end, { desc = "Move " .. direction })
  end
end

-- Temporarily disabled in favor of WhichKey's built-in Vim motion help.
-- require("mini.clue").setup({
--   triggers = {
--     { mode = { "n", "x" }, keys = "<Leader>" },
--   },
--   window = {
--     delay = 300,
--   },
-- })
