local o = vim.api.nvim_set_option_value
local g = vim.g

-- =======================================
-- 1. General options.
-- =======================================

-- 1.1. Undo related options
o("undofile", true, {}) -- Persistent undo's across all sessions

-- 1.2. Backup files
o("backup", false, {}) -- Don't write backups. (For better performance and, unneeded non-sense
o("writebackup", false, {}) -- Don't write backups.

-- 1.3 Clipboard related options.
o("clipboard", "unnamed,unnamedplus", {}) -- Let's sync clipboards across platforms (Win###s, MacOS and, *Nix based systems)

-- =======================================
-- 2. Editing options.
-- =======================================

-- 2.1 Enable virtual edits
o("virtualedit", "onemore", {}) -- Allow going one more character of the line.

-- 2.2 Some indent based options.
o("shiftwidth", 2, {}) -- Insert two shifts per indent.
o("autoindent", true, {}) -- Copy indent from the current line when starting a new line
o("breakindent", true, {}) -- Indent wrapped lines too.
o("copyindent", true, {}) -- Copy the structure of the existing lines' indents.
o("expandtab", true, {}) -- Convert tabs to spaces.
o("smartindent", true, {}) -- Non-strict cindent.
o("tabstop", 2, {}) -- Insert two tabs per <TAB>

-- 2.3 Wrap related options.
o("wrap", true, {}) -- Show long lines as multiple lines.

-- 2.4 Folding.
o("foldcolumn", "1", {})
o("foldlevel", 99, {})
o("foldlevelstart", 99, {})
o("foldenable", true, {})

-- =======================================
-- 3. UI related options.
-- =======================================

-- 3.1 Enable line numbers.
o("number", true, {}) -- Enable line numbers

-- 3.2 See invisible characters 🧐
o("list", true, {}) -- Enable seeing invisible characters (actually it's UI characters)
o("listchars", "eol:↴,space:⋅", {}) -- See Spaces and eol's as a character.

-- =======================================
-- 4. Performance based options
-- =======================================

-- 4.1 Debloat
-- o.syntax = "off" -- Disable builtin syntax highlighting. We're using Treesitter!
