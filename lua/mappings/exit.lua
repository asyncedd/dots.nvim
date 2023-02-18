-- lua/mappings/exit.lua
-- The Greatest way to Exit Neovim

local map = vim.api.nvim_set_keymap

map("n", "ZZ", ":q!<CR>", {})
