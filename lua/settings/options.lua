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

-- 2. UI

-- 2.1 Line numbers.

-- Enable line numbers.
o.number = true

-- Enable relativenumber.
o.relativenumber = true
