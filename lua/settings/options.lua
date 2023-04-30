local o = vim.opt
local g = vim.g

-- ##############################
-- #         1. General         #
-- ##############################

-- // 1.1 Leader.
-- Set <leader> to be <Space>.
g.mapleader = " "


-- 2. Editing
-- ##############################
-- #         2. Editing         #
-- ##############################

-- // 2.1 Indentation options.

-- Enable Autoindent.
-- If you're entering into a new line via <CR> in normal mode or `o` `O` in normal mode,
-- It'll automatically indent the newline.
-- For example:
--
-- {
--   |
-- }
-- 
-- <CR>
-- 
-- {
--   
--   |
-- }
--
-- It does automatically indent but, except for when you don't type anything into the newline except for <BS> or <C-D>
-- and type <Esc>, <C-O> or <CR>, the indent is deleted once again.
--
-- Should be enabled by default. But, we're going to enable it anyways.

-- FACT: "ai" is a abbreviation for "autoindent"

o.ai = true

-- Enable Smartindent.
-- Do smart auto-indenting when starting a new line.
-- Works for C-like programs, but can be used for most languages.
-- Similar to `cindent` but, less strict.
-- Not the most useful option for non-C-like languages.
--
-- Smartindent is usually enabled when Autoindent is enabled.
--
-- For example:
--
-- if something then
--   |
-- end
--
-- <ESC>
--
-- if something then
-- █ 
-- end
--
-- And:
-- if something then
--   |
-- end
--
-- <CR>
--
-- if something then
-- 
--   |
-- end
--
-- Here's a list of rules that are defined for Smartindent.
--
-- Insert an indent after a line ending with "{"
-- Insert an indent starting with a keyword from:
-- "if", "else", "while", "do", "for", "switch"
-- -- Insert and indent before a line from starting with "}" (Only with the "O" operator).
-- When typing '}' as the first character in a new line, that line is given the same indent as the matching "{".
-- When typing '#' as the first character in a new line, the indent for that line is removed, the '#' is put in the first column.
--
-- For example:
-- 
-- {
-- 
-- }█
--
-- O
--
-- {
--   |
-- }
--

-- FACT: "si" abbreviates "smart indent"

o.si = true

