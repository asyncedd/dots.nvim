local vim = vim -- Avoid using expensive global searching.
local o = vim.api.nvim_set_option_value

o("number", true, {}) -- Enable Line numbers
o("cursorline", true, {})
o("list", true, {})
o("listchars", "eol:↴,space:⋅", {})

vim.api.nvim_command("colorscheme catppuccin")

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  callback = function()
    vim.defer_fn(function()
      require("configs.editor.treesitter")
    end, 0)
  end
})

