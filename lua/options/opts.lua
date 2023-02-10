local M = {
  -- General
  shiftwidth = 2, -- Set the indents to 2.
  undofile = true, -- Enable persistent undo's
  -- Don't store backup when overwriting the file,
  backup = false,
  writebackup = false,
  mouse = "a", -- Enable mouse for all modes

  -- Apperance
  breakindent = true, -- Indent wrapped lines to match line start
  cursorline = true, -- Highlight the line we're currently editting.
  linebreak = true, -- Break long lines into multiple. visually.
  number = true, -- Enable line numbers
  splitbelow = true, -- Splits below.
  splitright = true, -- Splits right.
  termguicolors = true, -- Enable GUI colors.
  showmode = false, -- Don't show the mode in the CLI.

  wrap = false, -- Show long lines as one big line.

  signcolumn = "yes", -- Always show sign columns.
  fillchars = "eob: ", -- Don't show the "~" outside of the buffers

  -- Editing
  ignorecase = true, -- Ignore case when searching.
  incsearch = true, -- Show search results whilst searching.
  infercase = true, -- Infer letter cases.
  smartcase = true, -- Don't ignore case if the pattern has an uppercase letter in it.
  smartindent = true, -- Get smart indents.

  completeopt = "menuone,noinsert,noselect", -- This is mainly for hrsh7th/nvim-cmp.
  virtualedit = "onemore", -- Allow going one more.
  formatoptions = "qjl1", -- Don't autoformat commands.

  splitkeep = "screen", -- Reduce scroll if the window splits.

  pumbleend = 10, -- Make the builtin completion menu slightly transparent
  pumhieght = 10, -- Make it smaller
  winblend = 10, -- floating windows are sightly transparent.

  list = true, -- Show them.
}

return M
