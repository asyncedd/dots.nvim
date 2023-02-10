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
  infercase = true -- Infer letter cases.
  smartcase = trye -- Don't ignore case if the pattern has an uppercase letter in it.
  smartcase = true -- Get smart idents.
}

return M
