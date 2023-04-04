local telescope = require("telescope")

telescope.setup({
  extensions = {
    undo = {
      -- telescope-undo.nvim config, see below
    },
  },
})

telescope.load_extension("undo")
telescope.load_extension("yank_history")
telescope.load_extension("possession")
telescope.load_extension("neoclip")

local keymap = vim.keymap.set

-- then use it on whatever picker you want
-- ex:
keymap("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end)

keymap("n", "<leader>u", "<cmd>Telescope undo<cr>")

keymap("n", "<leader>yh", "<cmd>Telescope yank_history<cr>")
keymap("n", "<leader>pn", "<cmd>Telescope possession list<cr>")
keymap("n", "<leader>ps", ":PossessionSave ")
keymap("n", "<leader>c", "<cmd>Telescope neoclip<cr>")
