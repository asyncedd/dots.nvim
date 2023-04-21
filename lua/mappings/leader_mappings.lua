-- mappings/leader_mappings.lua

local map = vim.api.nvim_set_keymap

map('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
map('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
map('n', '<Leader>e', ':e %<CR>', { noremap = true, silent = true })

