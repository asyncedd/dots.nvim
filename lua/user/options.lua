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
o.sw = 2 -- sw = shiftwidth
-- -- Automagically indents based on the previous line.
-- o.ai = true -- ai = artifical intelligent indents and totally not autoindent
-- -- Smartly indents based on the current syntax and filetype.
-- o.si = true -- si = smartindent
-- Expand tabs.
o.et = true -- et = expand tab

-- 3. UI stuff
-- 3.1 Enable line numbers.
-- Set lines numbers.
o.nu = true -- nu = line numbers
-- Also relative nuumbers
o.rnu = true -- rnu = relative line numbers
-- Also cursor lines.
o.cul = true

-- 3.2 Enable TermGUIColors.
-- Have those glorious 24 bit colors! Take that Windows XP!
o.tgc = true -- tgc = term gui colors.

