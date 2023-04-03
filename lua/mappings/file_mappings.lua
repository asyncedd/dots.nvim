-- mappings/file_mappings.lua

local map = vim.api.nvim_set_keymap

-- Save file
map("n", "<leader>s", ":w<CR>", { silent = true })

-- Save file and quit
map("n", "<leader>x", ":wq<CR>", { silent = true })

-- Quit without saving
map("n", "<leader>q", ":q!<CR>", { silent = true })

-- Save all buffers
map("n", "<leader>S", ":wa<CR>", { silent = true })

-- Open file explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Open a new tab
map("n", "<leader>t", ":tabnew<CR>", { silent = true })

-- Switch between tabs
map("n", "<leader><Tab>", ":tabnext<CR>", { silent = true })
map("n", "<leader><S-Tab>", ":tabprevious<CR>", { silent = true })

