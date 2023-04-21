-- require("snips.impatient")

local vim = vim -- Avoid expensive global searching.
local g = vim.g
local o = vim.api.nvim_set_option_value

o("shadafile", "NONE", {})

g.mapleader = " "

require("core.options")

local async = require("snips.async")

local loadModule = async.wrap(function(moduleName)
    require(moduleName)
end)

require("core.lazy")

vim.api.nvim_command("colorscheme catppuccin")

vim.defer_fn(function()
  async.sync(loadModule("core.autocmd"))
  async.sync(loadModule("mappings.movement"))
  async.sync(loadModule("mappings.lspsaga"))

  o("shadafile", "", {})
end, 0)
