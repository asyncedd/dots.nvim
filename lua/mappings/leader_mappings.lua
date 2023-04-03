-- mappings/leader_mappings.lua

local map = vim.api.nvim_set_keymap

-- Open terminal in insert mode
-- map("i", "<leader>sh", "<Esc>:term<CR>i", { silent = true })

-- Open terminal in normal mode
map("n", "<leader>sh", ":term<CR>", { silent = true })

-- Search for word under cursor
map("n", "<leader>f", "*N", { silent = true })

-- Toggle line numbers
map("n", "<leader>n", ":set number!<CR>", { silent = true })

-- Toggle relative line numbers
map("n", "<leader>r", ":set relativenumber!<CR>", { silent = true })

-- Clear search highlight
map("n", "<leader><space>", ":nohlsearch<CR>", { silent = true })

-- Toggle spellcheck
map("n", "<leader>sp", ":setlocal spell!<CR>", { silent = true })

