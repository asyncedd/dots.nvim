-- lua/plugins/loader/ui.lua
-- Where we load our eye-candy.

-- Avoid expensive global searching, we already have it at home!
local coroutineList = {}

-- Load the colorscheme and Treesitter first.
-- We love catppuccin, catppuccin is life.

require("plugins.configs.ui.catppuccin")

-- Time to set out beautiful `catppuccin` colorscheme!
-- It's Clean, cute and customizable!
-- Perfect for our programming lives! As we need the highest quality coffee!
vim.cmd("colorscheme catppuccin")

-- Nvim.treesitter makes our highlighting beautiful.
table.insert(coroutineList, coroutine.create(function() return require("plugins.configs.editor.treesitter") end))

-- These are the options for mini.indentscope.
local indentscope_opts = {
  -- We set the current-indent-scope visualizer symbol for a clean, onliner.
  symbol = "│",
  -- We also enable try_as_border.
  options = { try_as_border = true },
}

-- Heirline.nvim is a true minimalisitc statusline for Neovim.

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  callback = function ()
    require("plugins.configs.ui.heirline")
  end
})

-- Load indent_blankline and mini.indentscope for a clean and, aesthestically pleasing indent visualizer.
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function ()
    require("indent_blankline").setup()
  end
})

vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function ()
    require("mini.indentscope").setup(indentscope_opts)
  end
})

-- Colorizer is a beautiful color-code visualizer that is blazingly fast, if the Primeagen were to say it.
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function ()
    require("colorizer").setup({})
  end
})

-- CCCC.nvim is a powerful color picker for those that are picky! (me)
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function ()
    require("ccc").setup()
  end
})

-- Pretty-fold.nvim is a clean and cute, aesthetically pleasing alternative to the ugly builtin visualizer.

vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function ()
    require("pretty-fold").setup({})
  end
})

-- Mini.cursorword which visualizes the current word under the cursor.

vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function ()
    require("mini.cursorword").setup({})
  end
})

local results = {}
for _, co in ipairs(coroutineList) do
  local ok, result = coroutine.resume(co)
  if not ok then
    error(result)
  end
  table.insert(results, result)
end

