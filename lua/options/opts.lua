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

  wrap = false -- Show long lines as one big line.
}

return M
