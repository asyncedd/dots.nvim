local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " " 
o.shiftwidth = 2
o.undofile = true
o.backup = false
o.writebackup = false
o.mouse = "a"
o.swapfile = false
o.hidden = true
o.clipboard = "unnamed,unnamedplus"
o.expandtab = true
o.breakindent = true
o.cursorline = true
o.linebreak = true
o.relativenumber = true
o.number = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.showmode = false
o.wrap = false
o.signcolumn = "yes"
o.fillchars = "eob: "
o.ignorecase = true
o.incsearch = true
o.infercase = true
o.smartcase = true
o.smartindent = true
o.completeopt = "menuone,noinsert,noselect"
o.virtualedit = "onemore"
o.formatoptions = "qjl1"
o.splitkeep = "screen"
o.list = true
o.listchars = "eol:↴,space:⋅"
o.tabstop = 2
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true
})
