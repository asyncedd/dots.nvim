local o = vim.opt

vim.g.mapleader = " "

-- 1. UI
-- Enable line numbers.
o.number = true

-- Enable relative numbers.
o.relativenumber = true

-- enable TermGUI colors
o.tgc = true

-- ~~trick hyperfine ;)~~
o.cmdheight = 0

-- Pumhieght
o.pumheight = 10

-- Make completion menus slightly transparent
o.pumblend = 10

-- Make floating windows slightly transparent
o.winblend = 10

-- 2. Editing
-- Set the shift (indents) width.
o.shiftwidth = 2

-- Automagically expand tabs to spaces
o.expandtab = true

-- Automatically indent.
o.autoindent = true

-- Smartly indent.
o.smartindent = true

-- Indent wrapped lines.
o.breakindent = true

-- 3. Mini.basic stuff.
o.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
o.incsearch = true -- Show search results while typing
o.infercase = true -- Infer letter cases for a richer built-in keyword completion
o.smartcase = true -- Don't ignore case when searching if pattern has upper case

o.completeopt = "menuone,noinsert,noselect" -- Customize completions
o.virtualedit = "block" -- Allow going past the end of line in visual block mode
o.formatoptions = "qjl1" -- Don't autoformat comments

-- Folds
o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

-- Middle screen ;)
o.scrolloff = 999

-- enable cursorline
o.cursorline = true
