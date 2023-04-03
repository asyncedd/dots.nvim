local o = vim.o
local g = vim.g

-- General
g.mapleader = " "
o.shiftwidth = 2 -- Set the indents to 2.
undofile = true -- Enable persistent undo's
-- Don't store backup when overwriting the file,
o.backup = false
o.writebackup = false
o.mouse = "a" -- Enable mouse for all modes
o.swapfile = false -- Disable Swap files.
o.hidden = true -- Don't automatically save whilst changing buffers.

-- Apperance
o.breakindent = true -- Indent wrapped lines to match line start
o.cursorline = true -- Highlight the line we're currently editting.
o.linebreak = true -- Break long lines into multiple. visually.
o.number = true -- Enable line numbers
o.splitbelow = true -- Splits below.
o.splitright = true -- Splits right.
o.termguicolors = true -- Enable GUI colors.
o.showmode = false -- Don't show the mode in the CLI.

o.wrap = false -- Show long lines as one big line.

o.signcolumn = "yes" -- Always show sign columns.
o.fillchars = "eob: " -- Don't show the "~" outside of the buffers

-- Editing
o.ignorecase = true -- Ignore case when searching.
o.incsearch = true -- Show search results whilst searching.
o.infercase = true -- Infer letter cases.
o.smartcase = true -- Don't ignore case if the pattern has an uppercase letter in it.
o.smartindent = true -- Get smart indents.

o.completeopt = "menuone,noinsert,noselect" -- This is mainly for hrsh7th/nvim-cmp.
o.virtualedit = "onemore" -- Allow going one more.
o.formatoptions = "qjl1" -- Don't autoformat commands.

o.splitkeep = "screen" -- Reduce scroll if the window splits.

o.pumbleend = 10 -- Make the builtin completion menu slightly transparent
o.pumhieght = 10 -- Make it smaller
o.winblend = 10 -- floating windows are sightly transparent.

o.list = true -- Show them.
o.listchars = "" -- Couldn't think about it.

-- Disable menu loading
g.did_install_default_menus = 1
g.did_install_syntax_menu = 1

-- Don't load native syntax completion
g.loaded_syntax_completion = 1

-- Don't load spell files
g.loaded_spellfile_plugin = 1

-- Don't load zipPlugin.vim, gzip.vim and tarPlugin.vim
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1

-- Disable SQL Omni completion
g.loaded_sql_completion = 1
