local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local modules_dir = vim.fn.stdpath("config") .. "/lua/" .. "modules"

local Lazy = {}

local async = require("util.async")

function Lazy:load_plugins()
  self.modules = {}

  local append_nativertp = async.wrap(function (step)
    package.path = package.path
      .. string.format(";%s;%s", modules_dir .. "/configs/?.lua", modules_dir .. "/configs/?/init.lua")
    step()
  end)

  local get_plugins_list = async.wrap(function (step)
    local list = {}
    local plugins_list = vim.split(vim.fn.glob(modules_dir .. "/plugins/*.lua"), "\n")
    if type(plugins_list) == "table" then
      for _, f in ipairs(plugins_list) do
        list[#list + 1] = f:sub(#modules_dir - 6, -1)
      end
    end
    step(list)
  end)

  async.sync(function (step)
    append_nativertp(function ()
      get_plugins_list(function (plugins_file)
        local thunks = {}
        for _, m in ipairs(plugins_file) do
          local thunk = async.wrap(function (step)
            local modules = require(m:sub(0, #m - 4))
            if type(modules) == "table" then
              for name, conf in pairs(modules) do
                    self.modules[#self.modules + 1] = vim.tbl_extend("force", { name }, conf)
                    step(function()
                      print(self.modules)
                      require("lazy").setup(self.modules)
                    end)
              end
            end
            step()
          end)
          table.insert(thunks, thunk)
        end
        async.wait_all(thunks)(step)
      end)
    end)
  end)
end

function Lazy:load_lazy()
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  self:load_plugins()
  vim.opt.rtp:prepend(lazypath)
end

Lazy:load_lazy()
