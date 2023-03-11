-- Avoid expensive global variable searching, we already have it at home!
local maps = vim.api.nvim_set_keymap

-- Open NvimTree via `<leader>tr`
maps("n", "<leader>tr", "<cmd>:NvimTreeToggle<CR>", { desc = "Open Nvim tree." })
