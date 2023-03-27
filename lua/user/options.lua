-- lua/user/options
-- Options for Neovim.

local o = vim.opt
local g = vim.g

-- 1. IMPORTANT STUF
-- 1.1 Set the mapleader key to <Space>
g.mapleader = " "

-- 1.2 Fix markdown indentations.
g.markdown_recommended_style = 0

-- 2. Editor stuff.
-- 2.1 Indentations.
-- As, 0.2x Devs, we need our 2 space indentation
o.shiftwidth = 2
-- Automagically indents based on the previous line.
o.autoindent = true
-- Smartly indents based on the current syntax and filetype.
o.smartindent = true

-- 3. UI stuff
-- 3.1 Enable line numbers.
-- Set lines numbers.
o.number = true
-- Also relative nuumbers
o.relativenumber = true
-- 3.2 Enable TermGUIColors.
-- Have those glorious 24 bit colors! Take that Windows XP!
o.termguicolors = true

