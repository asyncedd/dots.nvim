vim.loader.enable()

require("settings")
require("settings.options")
require("settings.keymap")
require("settings.autocmd")

require("plugins")

vim.cmd("colorscheme " .. (vim.g.vscode and "habamax" or dots.UI.colorscheme.name))

for name, icon in pairs(dots.UI.icons.LSP.diagnostics) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end
