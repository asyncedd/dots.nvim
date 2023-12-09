vim.loader.enable()

require("settings")
require("settings.options")
require("settings.autocmd")
require("plugins")

vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
  pattern = "VeryLazy",
  callback = function()
    require("settings.keymap")
  end,
})

vim.cmd("colorscheme " .. (vim.g.vscode and "habamax" or dots.UI.colorscheme.name))

for name, icon in pairs(dots.UI.icons.LSP.diagnostics) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
})
