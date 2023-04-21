local modules_dir = vim.fn.stdpath("config") .. "/lua/modules"
local lazy_path = string.format("%s/site/", vim.fn.stdpath("data")) .. "lazy/lazy.nvim"
local fn = vim.fn
local api = vim.api

local Lazy = {}

function Lazy:load_plugins()
  self.modules = {}

  local append_nativertp = function()
    package.path = package.path
    .. string.format(";%s;%s", modules_dir .. "/configs/?.lua", modules_dir .. "/configs/?/init.lua")
  end

  local get_plugins_list = function()
    local list = {}
    local plugins_list = vim.split(fn.glob(modules_dir .. "/plugins/*.lua"), "\n")
    if type(plugins_list) == "table" then
      for _, f in ipairs(plugins_list) do
        -- fill list with `plugins/*.lua`'s path used for later `require` like this:
        -- list[#list + 1] = "plugins/completion.lua"
        list[#list + 1] = f:sub(#modules_dir - 6, -1)
      end
    end
    return list
  end

  append_nativertp()

  local plugins_file = get_plugins_list()
  for _, m in ipairs(plugins_file) do
    -- require modules which returned in previous operation like this:
    -- local modules = require("modules/plugins/completion.lua")
    local modules = require(m:sub(0, #m - 4))
    if type(modules) == "table" then
      for name, conf in pairs(modules) do
        self.modules[#self.modules + 1] = vim.tbl_extend("force", { name }, conf)
      end
    end
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
      },
    },
  }

  require("lazy").setup(self.modules, lazy_settings)
end

Lazy:load_lazy()
