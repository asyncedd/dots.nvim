local o = vim.opt

-- 1. Editing

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

-- Set Expandtab to two.
-- Add an appropiate number of spaces per <Tab>

-- Enable Copyindent.
-- Copy the structure of existing lines indent when autoindenting.
o.si = true
