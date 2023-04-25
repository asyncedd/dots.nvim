-- Thank you to folke with his neodev plugin for this!
-- https://github.com/folke/neodev.nvim
local ret = {}

local deepExtend = vim.tbl_deep_extend

if package.loaded["lazy"] then
  local lazy_plugins = require("lazy").plugins()
  for _, plugin in ipairs(lazy_plugins) do
    ret[plugin.dir] = true
  end
end

local library = {
  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
  [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
  -- [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
  -- [vim.fn.expand("~/.config/nvim/lua")] = true,
  -- ["./?.lua"] = true,
}

-- Thank you for NvChad for this too! https://nvchad.com/docs/config/walkthrough
library = deepExtend("force", library, ret)
library = deepExtend("force", library, vim.api.nvim_get_runtime_file("", true))

-- require("neodev").setup({
--   library = {
--     enable = false,
--   },
-- })

return {
  Lua = {
    runtime = {
      version = "LuaJIT", --[[ 
      paths = {
        "?/init.lua",
        "?.lua",
      }, ]]
    },
    diagnostics = {
      globals = { "vim" },
      neededFileStatus = {
        ["codestyle-check"] = "Any",
      },
    },
    workspace = {
      library = library,
      checkThirdParty = false,
      -- maxPreload = 1000000,
      -- preloadFileSize = 100000,
    },
    completion = {
      callSnippet = "Replace",
      wordspaceWord = true,
    },
    format = {
      enable = true,
      defaultConfig = {
        indent_style = "space",
        indent_size = "2",
        continuation_indent_size = "2",
      },
    },
  },
}
