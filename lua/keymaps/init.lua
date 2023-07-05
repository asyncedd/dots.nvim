local map = vim.keymap.set

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- A couple Helix/Kakoune keymaps
map({ "n", "o", "x" }, "gl", "$", { desc = "Go to the last character in the line" })
map({ "n", "o", "x" }, "gh", "0", { desc = "Go to the first character in the line" })

-- Super fun keymap wow!
map({ "n" }, "<C-C>", "ciw", { desc = "Change inside word" })

-- Code action
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Open the current buffer's code actions" })

-- Terminal
map(
  "n",
  "<leader>gt",
  "<cmd>lua require('core.utils.lazyvim').float_term(nil, { ctrl_hjkl = false, esc_esc = true })<CR>"
)
map(
  "n",
  "<leader>gg",
  "<cmd>lua require('core.utils.lazyvim').float_term('lazygit', { ctrl_hjkl = false, esc_esc = true })<CR>"
)
