-- Wrap up this function in a vim.schedule to load it in a later time.
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function ()
    -- Set up the Comment plugins. A modern alternative to the vim-fugitive.
    require("Comment").setup()
  end
})
