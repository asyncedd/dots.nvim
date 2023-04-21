-- Wrap up this function in a vim.schedule to load it in a later time.
vim.schedule(function ()
  -- Set up the Comment plugins. A modern alternative to the vim-fugitive.
  require("Comment").setup()
end)
