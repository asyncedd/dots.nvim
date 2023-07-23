-- init.lua
vim.loader.enable()

require("settings")

-- Setup some options
require("settings.options")

-- Setup the plugins
require("plugins")

vim.cmd("colorscheme " .. (dots.colorscheme.enabled or "habamax"))

require("settings.autocmds")
require("settings.keymaps")

for name, icon in pairs(dots.UI.icons.LSP) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = {
    source = "if_many", -- Or "if_many"
    prefix = "", -- Could be '●', '▎', 'x'
  },
  float = {
    source = "if_many", -- Or "if_many"
  },
})
