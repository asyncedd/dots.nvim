local vim = vim -- Avoid using expensive global searching.
local o = vim.api.nvim_set_option_value


vim.api.nvim_command("colorscheme catppuccin")

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  callback = function()
    vim.defer_fn(function()
      require("configs.editor.treesitter")
      require'colorizer'.setup()
    end, 0)
  end
})
