local lazyLoad = require("core.utils.lazyLoad")

local lsp = {}

lsp[1] = {
  "neovim/nvim-lspconfig",
  init = lazyLoad("nvim-lspconfig"),
  config = function()
    require("lsp.config")
  end,
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = function()
        require("lsp.mason")
      end,
      -- init = lazyLoad("mason.nvim"),
      build = "<cmd>Mason<cmd>",
      cmd = {
        "Mason",
      },
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
      },
      cond = vim.g.bootstrap,
      -- event = "BufReadPre",
    },
    "folke/neodev.nvim",
    {
      "glepnir/lspsaga.nvim",
      config = function()
        require("lsp.saga")
      end,
      dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    },
    "MunifTanjim/nui.nvim",
    {
      "VidocqH/lsp-lens.nvim",
      config = true,
    },
  },
}

lsp[2] = {
  "jose-elias-alvarez/null-ls.nvim",
  init = lazyLoad("null-ls.nvim"),
  config = function()
    require("lsp.null")
  end,
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
  },
}

lsp[3] = {
  "smjonas/inc-rename.nvim",
  config = true,
  keys = {
    { "<leader>rn", ":IncRename " },
  },
}

lsp[4] = {
  "lvimuser/lsp-inlayhints.nvim",
  config = true,
  event = "LspAttach",
}

return lsp
