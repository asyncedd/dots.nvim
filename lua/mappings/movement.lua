-- Avoid expensive global variable searching, we already have it at home!
local map = vim.api.nvim_set_keymap

-- Move up/down on VISUAL line instead of a ACTUAL line
-- Go down one visual line instead an actual line. (Useful for wrapped lines)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Go up one visual line instead an actual line. (Useful for wrapped lines)
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
