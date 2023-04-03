local config_dir = vim.fn.stdpath("config")
local modules_dir = config_dir .. "/lua/modules"
local lazy_path = string.format("%s/site/", vim.fn.stdpath("data")) .. "lazy/lazy.nvim"
local fn = vim.fn
local api = vim.api

local Lazy = {}

function Lazy:load_plugins()
  self.modules = {}  -- Initialize the table to store the loaded plugins
  local cache_dir = os.getenv("HOME") .. "/.cache/nvim"
  local cache_file = cache_dir .. "/plugins_cache.lua"
  local plugins_list = vim.split(fn.glob(modules_dir .. "/plugins/*.lua"), "\n")  -- Get the list of all plugin files

  local function cache_plugins(operation)
    local cache_content
    local f = io.open(cache_file, "r")
    if operation == "load" and f then
      cache_content = f:read("*all")
      f:close()
    elseif operation == "save" then
      if not vim.fn.isdirectory(cache_dir) then
        os.execute("mkdir -p " .. cache_dir)
      end
      cache_content = ""
      for i, module in ipairs(self.modules) do
        if module.conf then
          cache_content = cache_content .. module.name .. "," .. module.conf .. "\n"
        end
      end
      f = io.open(cache_file, "w")
      if f then
        f:write(cache_content)
        f:close()
      end
    end

    if cache_content then
      if operation == "load" then
        local lines = vim.split(cache_content, "\n")
        for i, line in ipairs(lines) do
          local name, conf = string.match(line, "(.*),(.*)")
          self.modules[#self.modules + 1] = { name = name, conf = conf }
        end
      end
      return true
    end
    return false
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

  cache_plugins("load")

  for _, m in ipairs(plugins_list) do  -- Loop through the plugin files
    load_module(m)
  end

  cache_plugins("save")  -- Save the plugins to cache after they have been loaded
end


function Lazy:load_lazy()
  if not vim.loop.fs_stat(lazy_path) then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git "
    api.nvim_command("!git clone --filter=blob:none --branch=stable " .. lazy_repo .. lazy_path)
  end
  local start_time = os.clock()
  self:load_plugins()
  local end_time = os.clock()
  local elapsed_time = end_time - start_time
  print("Elapsed time: " .. elapsed_time .. " seconds")
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

-- local start_time = os.clock()
Lazy:load_lazy()
-- local end_time = os.clock()
-- local elapsed_time = end_time - start_time
-- print("Elapsed time:" .. elapsed_time .. "seconds")
