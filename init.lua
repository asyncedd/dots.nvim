vim.loader.enable()

require("settings.options")

require("settings.autocmd")

require("plugins")

vim.api.nvim_command("colorscheme catppuccin")

vim.schedule(function()
  require("after")
end)
