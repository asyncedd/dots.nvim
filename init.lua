-- Neoinit v.0.1

vim.loader.enable()

require("user.autocmd")

local disableBuiltinPlugins = require("user.builtinPlugins")
local o = vim.opt

for _, plugin in ipairs(disableBuiltinPlugins) do
  vim.g["loaded_" .. plugin] = 1
end

o.spell = false
o.undofile = false

require("user.options")

local config = vim.fn.stdpath("config")

-- Allow searching in `lua/plugins/configs/x.lua` or `lua/plugins/configs/x/init.lua`
package.path = config .. "/lua/plugins/configs/?.lua;" ..
  config .. "/lua/plugins/configs/?/init.lua;" ..
  package.path

require("plugins")

vim.api.nvim_command("colorscheme " .. require("user.settings").colorscheme)

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
    if lang and pcall(vim.treesitter.language.add, lang) then
      -- vim.treesitter.start()  -- sync
      vim.treesitter.start(nil, nil, { timeout = 1 }) -- async
    end
  end,
})

vim.schedule(function ()
  require("core.after")
end)

vim.loader.disable()
