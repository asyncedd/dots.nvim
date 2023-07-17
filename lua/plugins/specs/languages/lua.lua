return not (dots.languages.lua or dots.languages.lua.enable) and {} or {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { dots.languages.lua.treesitter.base and "lua", dots.languages.lua.treesitter.luadoc and "luadoc", dots.languages.lua.treesitter.patterns and "luap" })
    end,
  },
  dots.languages.lua.LSP.enable and {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {}
      },
    },
    dependencies = dots.languages.lua.LSP.neodev.enable and {
      {
        "folke/neodev.nvim",
        opts = dots.languages.lua.LSP.neodev.opts or {},
      },
    },
  },
}
