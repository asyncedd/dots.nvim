-- require("snips.impatient")

local vim = vim -- Avoid expensive global searching.
local g = vim.g
local o = vim.api.nvim_set_option_value

o("shadafile", "NONE", {})

g.mapleader = " "

require("core.options")

local async = require "snips.async"

local loadModule = async.wrap(function(moduleName, step)
    local module = require(moduleName)
    step(module)
end)

require("core.lazy")

vim.api.nvim_command("colorscheme catppuccin")

vim.defer_fn(function()
  async.sync(loadModule("core.autocmd"), function() end)

  async.sync(loadModule("mappings.movement"), function() end)

  async.sync(loadModule("mappings.lspsaga"), function() end)

end, 0)

vim.defer_fn(function() o("shadafile", "", {}) end, 0)
