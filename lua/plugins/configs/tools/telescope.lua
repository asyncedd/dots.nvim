require("telescope").setup({
  extensions = {
    undo = {
      -- telescope-undo.nvim config, see below
    },
  },
})
require("telescope").load_extension("undo")

-- then use it on whatever picker you want
-- ex:
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end)

vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
