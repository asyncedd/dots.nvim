-- lua/settings/options.lua
--
-- This is where I set my Neovim options.
--
-- This is over-documented so, you can use "}" to go foward a blankline and "}" to go backward to rapidly navigate through!
--
-- For now, this is how my configuration is structured.
--
-- LEGEND:
--
-- * 0 - Declaring variables
-- * 1 - Declaring general options.
-- * 2 - Declaring Editor options.
--
-- This is what each does:
-- *  0 - Set locals for easy use in the buffer.
-- *  1 - Set some general options that doesn't really belong to any category.
-- *  2 - Set some editor options for editing text fast!
--
-- For fast navigation, I've set codes before each category.
-- Here's the list:
-- *  0 - R9i
-- *  2 - Ayz
-- *  3 - iy0
-- 
-- You can now go to each category by: "/ [CODE_GOES_HERE]"
-- To go back to the legend, you can press "gg". This will go to the first line in a buffer.
--
-- (NOTE: None of these codes mean anything. I've generated them randomly via Random.org's random string generator.

-- CODE: R9i
-- #############################
-- #  0. Declaring variables.  #
-- #############################

-- Set local "o" to vim.opt.
-- 
-- vim.opt is basically a wrapper that sets options.
--
-- SYNTAX:
-- vim.opt.[option_name] = value

local o = vim.opt

-- Set local "g" to vim.g.
--
-- vim.g is basically a wrapper that sets globals.
--
-- Globals can be accessed anywhere once set.
--
-- SYNTAX:
-- vim.g.[global_name] = value

local g = vim.g

-- CODE: Ayz
-- ##############################
-- #         1. General         #
-- ##############################

-- // 1.1 Leader.
-- Set <leader> to be <Space>.
g.mapleader = " "


-- CODE: iy0
-- ##############################
-- #         2. Editing         #
-- ##############################

-- // 2.1 Indentation options.

--- Enable Autoindent.
--
--- If you're entering into a new line via <CR> in normal mode or `o` `O` in normal mode,
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
--- It does automatically indent but, except for when you don't type anything into the newline except for <BS> or <C-D>
-- and type <Esc>, <C-O> or <CR>, the indent is deleted once again.
--
--- Should be enabled by default. But, we're going to enable it anyways.
-- 
-- FACT: "ai" is a abbreviation for "autoindent"

o.ai = true

--- Enable Smartindent.
--- Do smart auto-indenting when starting a new line.
--- Works for C-like programs, but can be used for most languages.
--- Similar to `cindent` but, less strict.
--- Not the most useful option for non-C-like languages.
--
--- Smartindent is usually enabled when Autoindent is enabled.
--
--- For example:
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
--- Here's a list of rules that are defined for Smartindent.
--
--- Insert an indent after a line ending with "{"
--- Insert an indent starting with a keyword from:
-- "if", "else", "while", "do", "for", "switch"
--- Insert and indent before a line from starting with "}" (Only with the "O" operator).
--- When typing '}' as the first character in a new line, that line is given the same indent as the matching "{".
--- When typing '#' as the first character in a new line, the indent for that line is removed, the '#' is put in the first column.
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
--
-- FACT: "si" abbreviates "smart indent"

o.si = true

--- Set Shiftwith to 2.
-- 
--- Shiftwidth sets the number of spaces of each (auto)indent.
--- Used for "cindent" >> and <<.
--- Other than the three listed above, "autoindent", "smartindent" also uses the value of shiftwidth.
--
--- When zero, the "tabstop" will be used.
--
--- SOME PERSONAL FACTORS:
-- Why I've used 2 is a matter of personal prefences.
-- But, here are some reasons on why:
--   * Spaces (which we'll be using) are more flexible than tabs and, more "global" than tabs.
--   * Two is the perfect balance of readability and screen real estate.
--   * Most people uses 2 spaces.
--
--- So, in summary, they're simply a matter of personal prefences.
--
-- FACT: "sw" abbreviates "shift width"

o.sw = 2

--- Set Tabstop to 2.
--
--- If "shiftwidth" is two, it's only logical to also set <Tab>s to two.
--
--- I'll go for a very brief explanation on what Tabstop does.
--- It's bascially saying to Neovim to use two spaces for each <Tab> inserted.
--- So, it's mainly for consistency.
--
-- FACT: "ts" abbreviations of "tabstop"

o.ts = 2

--- Enable Expandtab.
--
--- In Insert Mode: Use the appropiate number of spaces to insert a <Tab>.
--- Spaces will also be used in indents too!
-- 
--- TIP: To insert a real tab when, "expandtab" is turned on, use <C-v><Tab>!
--
-- FACT: "et" is abbreviates "expandtab"

o.et = true
