local map = vim.keymap.set

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- https://github.com/mhinz/vim-galore#saner-command-line-history
map("c", "<C-n>", "wildmenumode() ? '<C-n>' : '<Down>'", { expr = true, desc = "Go to next item." })
map("c", "<C-p>", "wildmenumode() ? '<C-p>' : '<Up>'", { expr = true, desc = "Go to next prev." })
