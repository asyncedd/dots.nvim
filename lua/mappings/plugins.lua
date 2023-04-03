local maps = vim.api.nvim_set_keymap

-- Open NvimTree via `<leader>tr`
maps("n", "<leader>tr", "<cmd>:NvimTreeToggle<CR>", { desc = "Open Nvim tree." })
