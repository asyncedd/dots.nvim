vim.loader.enable()

require("settings.options")
require("settings.keymap")
require("settings.autocmd")

require("plugins")

vim.cmd("colorscheme " .. (vim.g.vscode and "habamax" or "onedark"))

for name, icon in pairs({
  Error = " ",
  Warn = " ",
  Hint = "󰌵 ",
  Info = " ",
}) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end
