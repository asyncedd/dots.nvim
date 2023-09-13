require("settings.options")

require("plugins")

if not vim.g.vscode then
  vim.cmd("colorscheme onedark")
end
