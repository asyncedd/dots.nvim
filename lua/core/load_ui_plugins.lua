vim.api.nvim_command("colorscheme catppuccin")

vim.defer_fn(function()
  require("configs.editor.treesitter")
end, 0)
