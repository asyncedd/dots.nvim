-- mappings/buffer_mappings.lua

local map = vim.api.nvim_set_keymap

-- Cycle through open buffers
map("n", "<leader>bn", ":bn<CR>", { silent = true })
map("n", "<leader>bp", ":bp<CR>", { silent = true })

-- Navigate to next/previous buffer in list
map("n", "<leader>]", ":bnext<CR>", { silent = true })
map("n", "<leader>[", ":bprevious<CR>", { silent = true })
