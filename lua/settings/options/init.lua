local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs
opt.shiftwidth = 2

-- Clipboard
vim.schedule(function()
  opt.clipboard = "unnamedplus"
  opt.undofile = true
end)
