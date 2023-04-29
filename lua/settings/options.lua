local o = vim.opt

-- 1. Editor

-- 1.1 Indentation options.

-- Enable AutoIndent.
-- Automatically copy the current line's indentation when starting a new line.
o.ai = true

-- Enable SmartIndent
-- Do smart autoindenting when starting a new line.
o.si = true

-- Enable SmartTab
-- <Tab>'ing infront of a line inserts blanks according to `shiftwidth` (which is two)
o.sta = true

-- Enable ExpandTab
-- In insert mode, use appropiate number of spaces to insert a <Tab>
o.et = true

-- Set Shiftwidth to two.
-- For each step of (auto)indenting, use two spaces.
o.sw = 2

-- 1.2 Undo

-- Enable undofile.
-- Saves undos into a file.
o.udf = true

-- 2. UI

-- 2.1 Line numbers.

-- Enable line numbers.
o.nu = true

-- Enable relativenumber.
o.rnu = true

-- Enable cursorline.
o.cul = true

-- 2.2 Statusline

-- Set cmdheight to 0.
o.ch = 0

-- Use a global statusline.
o.ls = 3

-- 2.3 Pop up menu.

-- Make pumhieght a little bit smaller. (This will limit the amount of items that will fit into a completion menu, and leave the rest to be scrolled.
o.ph = 5

-- Make the pumblend a little bit transparent. (This is just for aesthetic purposes, doesn't do anything really useful.)
o.pb = 30

-- 2.4 Scrolling.
o.so = 999
