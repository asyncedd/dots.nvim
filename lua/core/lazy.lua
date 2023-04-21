local config_dir = vim.fn.stdpath("config")
local modules_dir = config_dir .. "/lua/modules"
local lazy_path = string.format("%s/site/", vim.fn.stdpath("data")) .. "lazy/lazy.nvim"
local fn = vim.fn
local api = vim.api

local Lazy = {}

function Lazy:load_plugins()
  self.modules = {} -- Initialize the table to store the loaded plugins
  local cache_dir = vim.fn.stdpath("cache") .. "/.cache/nvim"
  local cache_file = cache_dir .. "/plugins_cache.lua"
  local plugins_list = vim.fn.glob(modules_dir .. "/plugins/*.lua") -- Get the list of all plugin files
  local plugins_list = vim.split(plugins_list, "\n")

  package.path = package.path
    .. string.format(";%s;%s", modules_dir .. "/configs/?.lua", modules_dir .. "/configs/?/init.lua")

  for _, m in ipairs(plugins_list) do -- Loop through the plugin files
    local modules = require(m:sub(#modules_dir - 6, -5)) -- Load the plugin file
    if type(modules) == "table" then -- If the loaded plugin is a table
      for name, conf in pairs(modules) do -- Loop through the table
        self.modules[#self.modules + 1] = vim.tbl_extend("force", { name }, conf) -- Add the plugin to `self.modules`
      end
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

  local lazy_settings = {
    install = {
      missing = true,
      colorscheme = { "catppuccin" },
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
