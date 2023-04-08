-- Thank you to folke with his neodev plugin for this!
-- https://github.com/folke/neodev.nvim
local ret = {}

if package.loaded["lazy"] then
  local lazy_plugins = require("lazy").plugins()
  for _, plugin in ipairs(lazy_plugins) do
    ret[plugin.dir] = true
  end
end

local library = {
  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
  [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
  [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true
}

-- Thank you for NvChad for this too! https://nvchad.com/docs/config/walkthrough
library = vim.tbl_deep_extend("force", library, ret)

return {
  Lua = {
    runtime = {
      version = "LuaJIT",
    },
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      library = library,
      maxPreload = 100000,
      preloadFileSize = 10000,
    },
  },
}

