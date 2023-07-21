local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local modules_dir = vim.fn.stdpath("config") .. "/lua/plugins"

if not vim.uv.fs_stat(lazypath) then
  print(" Bootstrapping lazy.nvim!")
  vim.cmd("!git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable " .. lazypath)
  print(" Done!")
end

vim.opt.rtp:prepend(lazypath)

local get_plugins = function()
  local ls = {}

  local get_plugins_list = function()
    local list = {}
    local plugins_list = vim.split(
      vim.fn.glob(modules_dir .. "/specs/*.lua") .. "\n" .. vim.fn.glob(modules_dir .. "/specs/**/*.lua"),
      "\n"
    )

    for _, f in ipairs(plugins_list) do
      list[#list + 1] = f:sub(#modules_dir - 6, -1)
    end
    return list
  end

  local plugins_file = get_plugins_list()
  for _, m in ipairs(plugins_file) do
    local modules = require(m:sub(0, #m - 4))
    for i, v in pairs(modules) do
      ls[#ls + 1] = v
    end
  end

  return ls
end

require("lazy").setup({
  get_plugins(),
}, {
  defaults = {
    lazy = dots.lazy.defaults.lazy,
  },
  install = {
    colorscheme = { dots.lazy.default_to_current_colorscheme and dots.colorscheme.enabled },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "spellfile",
        "matchit",
        "matchparen",
      },
    },
  },
})
