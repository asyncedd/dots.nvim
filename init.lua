require("settings.options")

require("plugins")

if not vim.g.vscode then
  vim.cmd("colorscheme onedark")
  -- vim.cmd("colorscheme horizon")
end

for name, icon in pairs({
  Error = " ",
  Warn = " ",
  Hint = "󰌵 ",
  Info = " ",
}) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end
