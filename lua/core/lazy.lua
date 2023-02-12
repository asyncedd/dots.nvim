local config_dir = vim.fn.stdpath("config")
local modules_dir = config_dir .. "/lua/modules"
local lazy_path = string.format("%s/site/", vim.fn.stdpath("data")) .. "lazy/lazy.nvim"
local fn = vim.fn
local api = vim.api

local Lazy = {}

function Lazy:load_plugins()
  self.modules = {}

  local cache_dir = config_dir .. "/cache"
  local cache_file = cache_dir .. "/plugins_cache.lua"

  local append_nativertp = function()
    -- 📁 Update the package path to include the directories for configs
    package.path = package.path
    .. string.format(";%s;%s", modules_dir .. "/configs/?.lua", modules_dir .. "/configs/?/init.lua")
  end

  -- 📁 Listing out plugins files in the directory.
  local get_plugins_list = function()
    -- 📂 Create an empty list to store the plugins file paths
    local list = {}

    -- 🔍 Search for all `.lua` files in the "plugins" directory
    local plugins_list = vim.split(fn.glob(modules_dir .. "/plugins/*.lua"), "\n")

    -- 🧪 Check if the result of the search is a table
    if type(plugins_list) == "table" then
      -- 🔄 Loop through each file found in the "plugins" directory
      for _, f in ipairs(plugins_list) do
        -- 📁 Add the file path to the `list` table
        -- The file path is created by removing the `modules_dir` from the full file path
        -- Example: "modules/plugins/completion.lua"
        list[#list + 1] = f:sub(#modules_dir - 6, -1)
      end
    end

    -- 🚀 Return the list of plugins file paths
    return list
  end

  -- 🔍 Reads data from cache file: "💾 cache file" -> "💼 self.modules". If successful: "✅ yes" else: "❌ no".
  local function load_plugins_from_cache()
    -- 🔄 Try to open the cache file for reading
    local f = io.open(cache_file, "r")

    if f then
      -- 📖 Read all contents of the file
      local content = f:read("*all")

      -- 🔒 Close the file
      f:close()

      -- 🧪 Evaluate the contents of the file as a Lua script
      local success, result = pcall(load(content))

      if success then
        -- 💾 Assign the result to `self.modules` if evaluation was successful
        self.modules = result
        return true
      end
    end

    -- ❌ Return false if unable to open cache file or if evaluation failed
    return false
  end

  -- 💾 Saves data of self.modules to cache file for faster loading later on.
  local function save_plugins_to_cache()
    local f = io.open(cache_file, "w") -- 💾 Open file for writing
    if f then
      f:write("return " .. vim.inspect(self.modules)) -- 💾 Write the `self.modules` table to file
      f:close() -- 🔒 Close the file after writing
    end
  end

  -- 🗑️ deletes the cache file, freeing up the storage space occupied by it.
  local function remove_cache()
    os.remove(cache_file) -- 🗑️ Remove the cache file
  end

  append_nativertp()

  -- 📁 Get plugins list with get_plugins_list()

  -- ❔ Check cache file with load_plugins_from_cache()

  -- 🚫 If cache load fails, 🔎 loop through plugins

  -- ⏰ require() each plugin

  -- 📜 Extend self.modules with each plugin's data

  -- 💾 Save data to cache with save_plugins_to_cache()

  local plugins_file = get_plugins_list() 
  -- 📂Get the list of plugins

  if not load_plugins_from_cache() then 
    -- 🧐Check if loading from cache is unsuccessful

    for _, m in ipairs(plugins_file) do 
      -- 🔄Iterate through all the plugins files

      -- require modules which returned in previous operation like this:
      -- local modules = require("modules/plugins/completion.lua")
      local modules = require(m:sub(0, #m - 4)) 
      -- 🔍Require the current plugin file, removing the ".lua" extension

      if type(modules) == "table" then 
        -- 🎉Check if the required module is a table

        for name, conf in pairs(modules) do 
          -- 🔄Iterate through the modules' names and configurations

          self.modules[#self.modules + 1] = 
          vim.tbl_extend("force", { name }, conf) 
          -- 💻Add the current module to the list of modules

        end
      end
    end
    save_plugins_to_cache() 
    -- 💾Save the loaded plugins to cache
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
