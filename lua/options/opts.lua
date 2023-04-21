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
  cursorline = true -- Highlight the line we're currently editting.
  linebreak = true, -- Break long lines into multiple. visually.
  number = true, -- Enable line numbers
}

return M
