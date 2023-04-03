require("telescope").setup({
  extensions = {
    undo = {
      -- telescope-undo.nvim config, see below
    },
  },
})

require("telescope").load_extension("undo")
require("telescope").load_extension("yank_history")

local keymap = vim.keymap.set

-- then use it on whatever picker you want
-- ex:
keymap("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end)

keymap("n", "<leader>u", "<cmd>Telescope undo<cr>")

keymap("n", "<leader>yh", "<cmd>Telescope yank_history<cr>")

require("cheatsheet").setup()
