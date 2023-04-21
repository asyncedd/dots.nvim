return function ()
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")
  local keymap = vim.keymap.set

  keymap("n", "<leader>a", mark.add_file)
  keymap("n", "<leader>e", ui.toggle_quick_menu)

  keymap("n", "<C-h>", function () ui.nav_file(1) end)
  keymap("n", "<C-t>", function () ui.nav_file(2) end)
  keymap("n", "<C-n>", function () ui.nav_file(3) end)
  keymap("n", "<C-s>", function () ui.nav_file(4) end)
end
