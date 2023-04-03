local config_dir = vim.fn.stdpath("config")
local modules_dir = config_dir .. "/lua/modules"
local lazy_path = string.format("%s/site/", vim.fn.stdpath("data")) .. "lazy/lazy.nvim"
local api = vim.api
local async = require("util.async")

local Lazy = {}

function Lazy:load_plugins()
  self.modules = {}
  local plugins_list = vim.fn.glob(modules_dir .. "/plugins/*.lua")
  local plugins_list = vim.split(plugins_list, "\n")

  package.path = package.path
  .. string.format(";%s;%s", modules_dir .. "/configs/?.lua", modules_dir .. "/configs/?/init.lua")

  local load_plugins = {}
  for _, m in ipairs(plugins_list) do
    local modules = require(m:sub(#modules_dir - 6, -5))
    if type(modules) == 'table' then
      for name, conf in pairs(modules) do
        self.modules[#self.modules + 1] = vim.tbl_extend('force', { name }, conf)
      end
    end
  end


  local results = async.parallel(load_plugins):await()
  for _, plugin_configs in ipairs(results) do
    for _, config in ipairs(plugin_configs) do
      table.insert(self.modules, config)
    end
  end
end

function Lazy:load_lazy()
  if not vim.loop.fs_stat(lazy_path) then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git "
    api.nvim_command("!git clone --filter=blob:none --branch=stable " .. lazy_repo .. lazy_path)
  end
  -- local start_time = os.clock()
  self:load_plugins()
  -- local end_time = os.clock()
  -- local elapsed_time = end_time - start_time
  -- print("Elapsed time: " .. elapsed_time .. " seconds")
  vim.opt.rtp:prepend(lazy_path)

  local colors = require("core.settings").colorscheme
  local lazy_settings = {
    defaults = {
      lazy = true,
      version = false
    },
    install = {
      missing = true,
      colorscheme = { colors, "catppuccin", "tokyonight" },
    },
    performance = {
      cache = {
        enabled = true,
        path = vim.fn.stdpath("cache") .. "/lazy/cache",
        disable_events = { "UIEnter", "BufReadPre" },
        ttl = 3600 * 24 * 2,
      },
      reset_packpath = true,
      rtp = {
        reset = true,
        disabled_plugins = {
          "gzip",
          "shada",
          "spellfile",
          "tohtml",
          "zipPlugin",
          "tarPlugin",
        },
      },
    },
  }

  require("lazy").setup(self.modules, lazy_settings)
end

-- local start_time = os.clock()
Lazy:load_lazy()
-- local end_time = os.clock()
-- local elapsed_time = end_time - start_time
-- print("Elapsed time:" .. elapsed_time .. "seconds")
