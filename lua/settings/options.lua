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
-- * 3 - Declaring UI options.
--
-- This is what each does:
-- *  0 - Set locals for easy use in the buffer.
-- *  1 - Set some general options that doesn't really belong to any category.
-- *  2 - Set some editor options for editing text fast!
--
-- For fast navigation, I've set codes before each category.
-- Here's the list:
-- *  0 - R9i
-- *  1 - Ayz
-- *  2 - iy0
-- *  3 - hFy
--
-- You can now go to each category by: "/ [CODE_GOES_HERE]"
-- To go back to the legend, you can press "gg". This will go to the first line in a buffer.
--
-- NOTE: None of these codes mean anything. I've generated them randomly via Random.org's random string generator.

-- CODE: R9i
--  ╭──────────────────────────────────────────────────────────╮
--  │ 0. Declaring variables                                   │
--  ╰──────────────────────────────────────────────────────────╯

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
--  ╭──────────────────────────────────────────────────────────╮
--  │ 1. General                                               │
--  ╰──────────────────────────────────────────────────────────╯

-- // 1.1 Leader.
-- Set <leader> to be <Space>.
g.mapleader = " "

-- Set <Localleader> to be "," (comma)
g.maplocalleader = ","

-- Map <Subleader> to be ";" (semicolon)
g.mapsubleader = ";"

-- CODE: iy0
--  ╭──────────────────────────────────────────────────────────╮
--  │ 2. Editor                                                │
--  ╰──────────────────────────────────────────────────────────╯

-- // 2.1 Indentation options.

-- Enable Autoindent.
--
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
--
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
-- Insert and indent before a line from starting with "}" (Only with the "O" operator).
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
--
-- FACT: "si" abbreviates "smart indent"

o.si = true

-- Set Shiftwidth to 2.
--
-- Shiftwidth sets the number of spaces of each (auto)indent.
-- Used for "cindent" >> and <<.
-- Other than the three listed above, "autoindent", "smartindent" also uses the value of shiftwidth.
--
-- When zero, the "tabstop" will be used.
--
-- SOME PERSONAL FACTORS:
-- Why I've used 2 is a matter of personal preferences.
-- But, here are some reasons on why:
--   * Spaces (which we'll be using) are more flexible than tabs and, more "global" than tabs.
--   * Two is the perfect balance of readability and screen real estate.
--   * Most people uses 2 spaces.
--
-- So, in summary, they're simply a matter of personal preferences.
--
-- FACT: "sw" abbreviates "shift width"

o.sw = 2

-- Set Tabstop to 2.
--
-- If "shiftwidth" is two, it's only logical to also set <Tab>s to two.
--
-- I'll go for a very brief explanation on what Tabstop does.
-- It's basically saying to Neovim to use two spaces for each <Tab> inserted.
-- So, it's mainly for consistency.
--
-- FACT: "ts" abbreviations of "tabstop"

o.ts = 2

-- Enable Expandtab.
--
-- In Insert Mode: Use the appropriate number of spaces to insert a <Tab>.
-- Spaces will also be used in indents too!
--
-- TIP: To insert a real tab when, "expandtab" is turned on, use <C-v><Tab>!
--
-- FACT: "et" abbreviates "expandtab"

o.et = true

-- Jumplist options for <C-i> and <C-o> jump motions.
-- The following option allows you to modify how jumplist works in Neovim.

-- o.jop = "stack": When set to "stack", the jumplist behaves like a web browser.
-- The relative location of entries in the jumplist is preserved, but subsequent entries
-- are discarded when navigating backwards in the jumplist and then jumping to a location.

o.jop = "stack"

-- Enable mouse movement tracking in Neovim.
-- This option allows plugins to track mouse movements in Neovim.
-- o.mousemev = true: When set to true, mouse movements can be tracked in Neovim.

o.mousemev = true

-- Enable breakindent.
-- This option allows you to visually indent every wrapped line.
-- o.bri = true: When set to true, every wrapped line will continue to be visually indented.

o.bri = true

-- Enable linebreak.
-- This option allows you to wrap long lines at a word instead of the final character.
-- o.lbr = true: When set to true, long lines will be wrapped at a word instead of the final character.

o.lbr = true

-- Fold-related options.
-- The following options allow you to modify how folds are displayed in Neovim.

-- o.foldcolumn = "1": Set the fold column to be at the "later" column of line numbers.
-- o.foldlevel = 99: Set the fold level to be 99.
-- o.foldlevelstart = 99: Set the starting fold level to be 99.
-- o.foldenable = true: Enable folding.

o.foldcolumn = "0"

o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- Undofile
--
-- Automatically save undo history to an undo file when writing a buffer to a file, and when reading a file, restores undo history from the same file on buffer read.
-- The directory used is set by 'undodir'.

vim.schedule(function()
  o.udf = true

  -- Set "unnamedplus" as the clipboard register.
  --
  -- Use the "+" clipboard register for all clipboard stuff.
  -- That includes: yank, delete, change and put.

  o.cb = "unnamedplus"
end)

-- Virtual edit
--
-- We'll be setting virtual edit to be "block".
-- What it does in question is that it'll make us able to select more than EOL in virtual block mode
--
-- EXAMPLE:
--
-- Normal mode:
-- AAAAA█A -> $l -> AAAAAA█
--
-- You see, it's not going over EOL.
--
-- But, in visual block mode. (<C-v>)
--
-- it can go oer EOL
--
-- like:
--
-- ████ -> ra aaaa
-- ████       aaaa
-- Wow, there's a funny square

o.ve = "block"

-- Searching

-- Ignore case
--
-- Ignore case in search patterns.
-- Kinda useful if you want to search but without the cAsE sEsEtIvEnEsS
-- This can be overruled via "\c" and "\C" - lower case and uppercase respectively.
o.ic = true

-- Smart case
--
-- Do NOT ignore case in search patterns if an uppercase letter is in it.
o.scs = true

-- CODE: hFy
--
--  ╭──────────────────────────────────────────────────────────╮
--  │ 3. UI                                                    │
--  ╰──────────────────────────────────────────────────────────╯

-- // 3.1 Line numbers.

-- Enable numbers.
--
-- Print the corresponding line number before each line.
-- I don't really have any more context for this so, I'll end it right here.
--
-- EXAMPLE:
--  1  -- init.lua
--  2
--  3  -- Blanklines and comments are counted!
--  4  print("wow, this is so cool!")
--  5
--
-- FACT: "nu" abbreviates "numbers"

o.nu = true

o.rnu = true

o.cul = true

-- Set sign column to be 4.
--
-- At max, I'm planing to have four items in my statuscolumn:
--    Line/Relnumbers.
--    Git
--
-- So, if I have a new diff, It'll not feel weird, by the signcolumn expanding

o.scl = "yes:1"

-- Enable TermGUIColors.
--
-- Enables 24-bit RGB colors in the TUI. Uses "gui" :highlight attributes instead of "cterm" attributes. BUT, requires an ISO-8613-3 compatible terminal. (most terminals)

o.tgc = true

-- Blinking cursor.
--
-- I've found in https://github.com/vsedov/nvim
-- I find it cool :)
--
-- This is from the help docs, it enables mode shapes, "Cursor" highlight, and blinking
o.gcr = {
  [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]],
  [[a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor]],
  [[sm:block-blinkwait175-blinkoff150-blinkon175]],
}

-- Pum options. (Popup menu)
--
-- Making the pum menu a bit transparent.
-- NOTE: This is pseudo-transparent.

o.pb = 25

-- Making pum menu a bit limited in the terms of screen real estate.
-- Basically it only shows 10 items into a popup menu.
-- Otherwise, it can be shown via scrolling.

o.ph = 10

-- Command line options.

-- Cmdheight to zero.
--
-- Making noice.nvim not feel so late.
--
-- Otherwise, cmdheight is a cool option.
-- It basically prevents those wierd "Press ENTER or type command to continue" prompts.
--

o.ch = 0

-- "Fix" emojis.
--
-- https://www.youtube.com/watch?v=F91VWOelFNE explains basically everything.
--
-- For a small TL;DR: Emojis are weird in width and might cause issues when editing and even displaying in TMUX.

o.emo = false

-- Enable global status.
--
-- If there are two windows, it'll always and ONLY show the one window last accessed.

o.ls = 3

-- Set GUI font to Cartograph CF.
--
-- It doesn't really matter for the TUI but, it does on GUI versions.

o.gfn = "Cartograph CF:h10"

-- Set scrolloff to be at the max.
--
-- It essentially specifies how many lines of lines should be kept above and below the cursor.
-- Setting it to 999 - the largest you can set, makes it so that the cursor is always kept in the middle.
-- Of course, this isn't true if there aren't enough lines above and below.

o.so = 999
