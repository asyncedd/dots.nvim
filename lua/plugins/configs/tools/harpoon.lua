local keymap = vim.keymap.set

keymap("n", "<leader>af", require("harpoon.mark").add_file)

local hui = require("harpoon.ui")
keymap("n", "<leader>mn", hui.toggle_quick_menu)

keymap("n", "<leader>1", function() hui.nav_file(1)end)
keymap("n", "<leader>2", function() hui.nav_file(2)end)
keymap("n", "<leader>3", function() hui.nav_file(3)end)

keymap("n", "<leader>nh", function() hui.nav_next()end)
