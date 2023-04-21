local vim = vim -- Avoid using expensive global searching.
local api = vim.api
local o = api.nvim_set_option_value

local function augroup(name)
  return api.nvim_create_augroup("lazyload_" .. name, { clear = true })
end

api.nvim_command("colorscheme catppuccin")

api.nvim_create_autocmd({ "BufReadPost" }, {
  group = augroup("ui"),
  callback = function()
    vim.defer_fn(function()
      require("configs.editor.treesitter")
      require("configs.ui.indent")
      require("configs.ui.heirline")
      require'colorizer'.setup()
      require("configs.editor.ufo")
    end, 0)
  end
})
