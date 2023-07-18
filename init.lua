-- init.lua
vim.loader.enable()

require("settings")

-- Setup some options
require("settings.options")

-- Setup the plugins
require("plugins")

vim.cmd("colorscheme " .. (dots.colorscheme.enabled or "habamax"))

require("settings.autocmds")

for name, icon in pairs(dots.UI.icons.LSP) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end
