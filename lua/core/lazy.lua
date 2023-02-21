local config_dir = vim.fn.stdpath("config")
local modules_dir = config_dir .. "/lua/modules"
local lazy_path = string.format("%s/site/", vim.fn.stdpath("data")) .. "lazy/lazy.nvim"
local api = vim.api
local async = require("util.async")

local Lazy = {}

function Lazy:load_plugins()
  self.modules = {}

  local cache_file = vim.fn.stdpath('cache') .. '/plugins_list.lua'

  local function load_plugins_list()
    local plugins_list = {}
    for _, filename in ipairs(vim.fn.glob(modules_dir .. '/plugins/*.lua', false, true)) do
      if vim.loop.fs_stat(filename).type == "file" then
        table.insert(plugins_list, filename)
      end
    end
    return plugins_list
  end

  local function save_plugins_list(plugins_list)
    local file = io.open(cache_file, 'w')
    if file then
      file:write("return {\n")
      for i = 1, #plugins_list do
        file:write(string.format("  '%s',\n", plugins_list[i]))
      end
      file:write("}\n")
      file:close()
    end
  end

  local function read_plugins_list_from_cache()
    local plugins_list = {}
    local chunk = loadfile(cache_file)
    if chunk then
      plugins_list = chunk()
    end
    return plugins_list
  end

  local plugins_list = read_plugins_list_from_cache()
  if #plugins_list == 0 then
    plugins_list = load_plugins_list()
    save_plugins_list(plugins_list)
  end


  -- Add config paths to package.path
  package.path = package.path .. ";" .. table.concat({
    modules_dir .. "/configs/?.lua",
    modules_dir .. "/configs/?/init.lua",
  }, ";")

  for _, m in ipairs(plugins_list) do
    local modules = require(m:sub(#modules_dir - 6, -5))
    if type(modules) == "table" then
      for name, conf in pairs(modules) do
        table.insert(self.modules, vim.tbl_extend("force", { name }, conf))
      end
    end
  end

  -- Create a coroutine to load the plugins
  local co = coroutine.create(function()
    local results = {}
    for _, m in pairs(plugins_list) do
      local modules = require(m:sub(#modules_dir - 6, -5))
      if type(modules) == "table" then
        for name, conf in pairs(modules) do
          table.insert(results, vim.tbl_extend("force", { name }, conf))
        end
      end
    end
    coroutine.yield(results)
  end)

  -- Await the coroutine and add the results to the self.modules table
  local ok, results = coroutine.resume(co)
  if not ok then
    error(results)
  end
  for _, config in ipairs(results) do
    table.insert(self.modules, config)
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
          "tutor",
          "man",
          "netrwPlugin",
          "rplugin"
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
