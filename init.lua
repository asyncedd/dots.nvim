vim.loader.enable()
vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"

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

for name, icon in pairs(dots.UI.icons.LSP.diagnostics) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

-- https://www.reddit.com/r/neovim/comments/1ayx62p/config_for_diagnostics/
vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
  },
})

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
