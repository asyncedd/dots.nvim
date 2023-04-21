coroutine.resume(coroutine.create(function()
  require("settings.options")

  require("settings.autocmd")

  require("plugins")

  vim.api.nvim_command("colorscheme catppuccin")
end))

