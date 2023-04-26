local o = vim.opt

-- 1. Editing

-- 1.1 Indent options.

-- Enable Autoindent.
-- Copy indent from current line when starting a new line.
o.ai = true

-- Enable Smartindent.
-- Do smart auto-indenting when starting a new line. Is mainly for C-like languages but, can also be used for other languages.
o.si = true

-- Enable Smarttabs
-- Tabbing infront of a line, will insert tabs accordingly using the value of `shiftwidth`.
o.sta = true

-- Set Shiftwidth to two.
-- Add two spaces for each step of (auto)indent.
o.sw = 2

-- Set Tabstop to two.
-- Add two spaces that a <Tab> in a file count for.
o.ts = 2

-- Enable Expandtabs.
-- To use spaces over tabs.
o.et = true

-- Enable Copyindent.
-- Copy the structure of existing lines indent when autoindenting.
o.si = true

-- 1.2 Wrapping

-- Enable wrapping.
-- Wrap long lines.
o.wrap = true

-- Enable line break.
-- Wrap long lines at a character in `breakat` (default " ^I!@*-+;:,./?")
o.lbr = true

-- Enable Breakindent
-- Indent wrapped lines.
o.bri = true

-- 1.3 Undos

-- Enable undofile
-- Saves undo history to a file when writing a buffer to a file and, restore on read.
o.udf = true

-- 1.4 Searching.

-- Enable incsearch.
-- Highlight matches whilst searching.
o.is = true

-- 2. UI Options.

-- 2.1 Line number settings.

-- Enable line numbers.
-- Print the line number infront of each line.
o.nu = true

-- Enable relative line numbers.
-- Show the line number relative to the line with the cursor in front of each line.
o.rnu = true

-- Enable cursorline.
-- Highlight the text line of the cursor with a lighter highlight I guess?
o.cul = true

