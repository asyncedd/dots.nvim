vim.defer_fn(function()
  vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function ()
      require("plugins.configs.completion.cmp")
    end,
  })
end, 0)
