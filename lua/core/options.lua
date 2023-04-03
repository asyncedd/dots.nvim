-- Avoid expensive global variable searching, we already have it at home!
local o = vim.opt

-- =======================================
-- 1. General options.
-- =======================================

-- 1.1. Undo related options
o.undofile = true -- Persistent undo's across all sessions

-- 1.2. Backup files
-- EDIT: They might not be unneeded!
o.backup = false -- Don't write backups. (For better performance and, unneeded non-sense
o.writebackup = false -- Don't write backups.

-- 1.3 Clipboard related options.
o.clipboard = "" -- Let's sync clipboards across platforms (Win###s, MacOS and, *Nix based systems)

-- 1.4 Tabline
-- o("showtabline", 2, {})
vim.api.nvim_command([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])

-- 1.5 Vim-matchup
vim.g.matchup_matchparen_offscreen = { method = "popup" }

-- Set the shell to bash.
-- o("shell", "/bin/bash", {}) -- Fish is a bit buggy on Neovim.

-- =======================================
-- 2. Editing options.
-- =======================================

-- 2.1 Enable virtual edits
-- o("virtualedit", "onemore", {}) -- Allow going one more character of the line.

-- 2.2 Some indent based options.
o.shiftwidth = 2 -- Insert two shifts per indent.
o.autoindent = true -- Copy indent from the current line when starting a new line
o.breakindent = true -- Indent wrapped lines too.
o.copyindent = true -- Copy the structure of the existing lines' indents.
o.expandtab = true -- Convert tabs to spaces.
o.smartindent = true -- Non-strict cindent.
o.tabstop = 2 -- Insert two tabs per <TAB>

-- 2.3 Wrap related options.
o.wrap = true -- Show long lines as multiple lines.

-- 2.4 Folding.
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
-- o("foldcolumn", "1", {})
-- o("foldmethod", "manual", {})
-- o("foldlevelstart", 99, {})
o.foldlevel = 1
o.foldopen = o.foldopen + "jump" -- when jumping to the line auto-open the folder

-- =======================================
-- 3. UI related options.
-- =======================================

-- 3.1 Enable line numbers.
o.number = true -- Enable line numbers
o.relativenumber = true -- Also relative numbers since, why not.

-- 3.2 See invisible characters 🧐
o.list = true -- Enable seeing invisible characters (actually it's UI characters)
o.listchars = { -- See Spaces and eol's as a character.
  eol = "↴",
  space = "⋅",
  tab = "▶ ",
  -- trail = "•",
  precedes = "«",
  extends = "»",
  nbsp = "␣",
}

-- 3.3 Emojis are weird on Neovim...
o.emoji = false

-- =======================================
-- 4. Performance based options
-- =======================================
-- 4.1 Lazy redraw.
o.lazyredraw= true

-- 4.2 Avoid long syntax highlgihting for big stuff.
o.synmaxcol = 128 -- avoid slow rendering for long lines

