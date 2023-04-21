-- lua/user/options
-- Options for Neovim.

local o = vim.opt
local g = vim.g

-- 1. IMPORTANT STUF
-- 1.1 Set the mapleader key to <Space>
g.mapleader = " "

-- 1.2 Fix markdown indentations.
vim.g.markdown_recommended_style = 0

-- 2. Editor stuff.
-- 2.1 Indentations.
-- As, 0.2x Devs, we need our 2 space indentation
o.shiftwidth = 2

-- 3. UI stuff
-- 3.1 Enable line numbers.
-- Set lines numbers.
o.number = true
-- 3.2 Enable TermGUIColors.
-- Have those glorious 24 bit colors! Take that Windows XP!
o.termguicolors = true

