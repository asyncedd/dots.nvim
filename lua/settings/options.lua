local o = vim.opt

-- Line numbers
o.number = true
o.relativenumber = true

-- Tabs
o.shiftwidth = 2
o.tabstop = 2

-- Clipboard
vim.schedule(function()
  o.clipboard = "unnamedplus"
  o.undofile = true
end)

-- Statuscolumn

-- Set sign column to be 4.
-- So, if I have a new diff, It'll not feel weird, by the signcolumn expanding

o.signcolumn = "yes:1"

vim.g.mapleader = " "

-- Statusline
o.cmdheight = 0

-- Folds

o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- Scrolloff

o.scrolloff = 15

-- Searching
o.ignorecase = true
o.smartcase = true
