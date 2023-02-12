local config_dir = vim.fn.stdpath("config")
local modules_dir = config_dir .. "/lua/modules"
local lazy_path = string.format("%s/site/", vim.fn.stdpath("data")) .. "lazy/lazy.nvim"
local fn = vim.fn
local api = vim.api

local Lazy = {}

function Lazy:load_plugins()
  self.modules = {}  -- Initialize the table to store the loaded plugins
  local cache_dir = config_dir .. "/cache"
  local cache_file = cache_dir .. "/plugins_cache.lua"
  local plugins_list = vim.split(fn.glob(modules_dir .. "/plugins/*.lua"), "\n")  -- Get the list of all plugin files

  local function cache_plugins(operation)  -- Function to load or save plugins from/to cache
    local f = io.open(cache_file, "r")
    if operation == "load" and f then  -- If cache file exists and we want to load plugins
      local content = f:read("*all")
      f:close()
      local success, result = pcall(load(content))  -- Load the content of the cache file
      if success then
        self.modules = result  -- Assign the loaded content to `self.modules`
        return true  -- Return `true` if the content was successfully loaded
      end
    elseif operation == "save" then  -- If we want to save plugins
      f = io.open(cache_file, "w")
      if f then  -- If cache file was successfully opened for writing
        f:write("return " .. vim.inspect(self.modules))  -- Write the contents of `self.modules` to the cache file
        f:close()  -- Close the cache file
      end
    end
    return false  -- Return `false` if the cache file doesn't exist or there was an error while loading the content
  end

  local function load_module(file)
    local modules = require(file:sub(#modules_dir - 6, -5))  -- Load the plugin file
    if type(modules) == "table" then  -- If the loaded plugin is a table
      for name, conf in pairs(modules) do  -- Loop through the table
        self.modules[#self.modules + 1] = vim.tbl_extend("force", { name }, conf)  -- Add the plugin to `self.modules`
      end
    end
  end

  -- 📁 Update the package path to include the directories for configs
    package.path = package.path .. string.format(";%s;%s", modules_dir .. "/configs/?.lua", modules_dir .. "/configs/?/init.lua")

  local loaded_from_cache = cache_plugins("load")
  if not loaded_from_cache then  -- If plugins couldn't be loaded from cache
    for _, m in ipairs(plugins_list) do  -- Loop through the plugin files
      coroutine.wrap(function() load_module(m) end)()
    end
    cache_plugins("save")  -- Save the plugins to cache after they have been loaded
  end
end


function Lazy:load_lazy()
  if not vim.loop.fs_stat(lazy_path) then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git "
    api.nvim_command("!git clone --filter=blob:none --branch=stable " .. lazy_repo .. lazy_path)
  end
  self:load_plugins()
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
          "tarPlugin"
        }
      },
    },
  }

  require("lazy").setup(self.modules, lazy_settings)
end

Lazy:load_lazy()
