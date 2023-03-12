-- Creating autocmds has a slight overhead so, we avoid that overead via vim.schedule.
-- Here is TJ explaining what it does: https://www.youtube.com/watch?v=GMS0JvS7W1Y
vim.schedule(function()
  -- Create a autocmd that will be executed when entering the cmdline.
  vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
    callback  = function ()
      -- Setup the completion for only the cmdline completion in contrast to Neovim's builtin omnifunc.
      require("plugins.configs.completion.cmpcmd")
    end
  })
end)

