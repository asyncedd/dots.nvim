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
  o.undodir = vim.fn.stdpath("data") .. "/backup//"

  -- https://www.reddit.com/r/neovim/comments/wlkq0e/neovim_configuration_to_backup_files_with/
  o.backup = true
  o.backupdir = vim.fn.stdpath("data") .. "/backup//"
end)

-- Statuscolumn

-- Set sign column to be 4.
-- So, if I have a new diff, It'll not feel weird, by the signcolumn expanding

o.signcolumn = "yes:1"

vim.g.mapleader = " "

-- Statusline
o.cmdheight = 0
o.laststatus = 3

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

o.pumblend = 10 -- Popup blend
o.pumheight = 10 -- Maximum number of entries in a popup
