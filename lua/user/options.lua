-- lua/user/options
-- Options for Neovim.

local o = vim.opt
local g = vim.g

-- Set the mapleader key to <Space>
g.mapleader = " "
-- As, 0.2x Devs, we need our 2 space indentation
o.shiftwidth = 2
-- Tabs take less file space, thus you need only 1 floppy disk, so take that to Windows XP!
o.expandtab = false
-- Set lines numbers.
o.number = true
-- Have those glorious 24 bit colors! Take that Windows XP!
o.termguicolors = true

