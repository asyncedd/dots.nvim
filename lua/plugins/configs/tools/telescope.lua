local telescope = require("telescope")

telescope.setup({})

telescope.load_extension("neoclip")
telescope.load_extension("persisted")
telescope.load_extension("projects")

local keymap = vim.keymap.set

-- then use it on whatever picker you want
-- ex:
keymap("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end)

keymap("n", "<leader>c", "<cmd>Telescope neoclip<cr>")

keymap("n", "<leader>pe", "<cmd>Telescope persisted<cr>")

keymap("n", "<leader>pt", "<cmd>Telescope projects<cr>")
