local map = vim.api.nvim_set_keymap

-- Set arrow keys to nil
map("n", "<Up>", "<Nop>", {})
map("n", "<Down>", "<Nop>", {})
map("n", "<Left>", "<Nop>", {})
map("n", "<Right>", "<Nop>", {})

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})
map("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

