return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      return require("plugins.configs.lsp.mason-lsp")
    end,
    config = true,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function()
      return require("plugins.configs.lsp.mason-null")
    end,
    config = true,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lsp.config")

      require("plugins.configs.lsp.native")
    end,
    dependencies = {
      "mason-lspconfig.nvim",
      "neodev.nvim",
      "rust-tools.nvim",
    },
    init = function()
      require("core.utils.lazy_load")("nvim-lspconfig")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      return require("plugins.configs.lsp.null")
    end,
    config = true,
    dependencies = {
      "mason-null-ls.nvim",
    },
    init = function()
      require("core.utils.lazy_load")("null-ls.nvim")
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {
      library = {
        plugins = false,
        runtime = true,
        types = true,
      },
      -- lspconfig = false,
      pathStrict = true,
    },
    config = true,
  },
  {
    "nvimdev/lspsaga.nvim",
    opts = function()
      return require("plugins.configs.lsp.saga")
    end,
    keys = {
      { "gf", "<cmd>Lspsaga lsp_finder<CR>", desc = "Find the symbols's definition" },
      {
        "<leader>ca",
        "<cmd>Lspsaga code_action<CR>",
        desc = "Open a code action (if any)",
        mode = {
          "n",
          "x",
        },
      },
      -- Renaming is handled by Spectre.nvim and, I don't want it to be handled by Lspsaga.
      { "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", desc = "Take a peek of the definition for the symbol" },
      { "<leader>lo", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto definition for the symbol." },
      { "<leader>so", "<cmd>Lspsaga outline<CR>", desc = "Open Lspsaga's code outline" },
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostic messages in the current line" },
      {
        "<leader>sb",
        "<cmd>Lspsaga show_buf_diagnostics<CR>",
        desc = "Show diagnostic messages in the current buffer",
      },
      {
        "<leader>sw",
        "<cmd>Lspsaga show_workspace_diagnostics<CR>",
        desc = "Show diagnostic messages in the current workspace",
      },
      {
        "<leader>sc",
        "<cmd>Lspsaga show_cursor_diagnostics<CR>",
        desc = "Show diagnostic messages in the hovered area",
      },
    },
    init = function()
      require("core.utils.lazy_load")("lspsaga.nvim")
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    opts = true,
    keys = {
      { "<leader>gr", ":IncRename ", desc = "Toggle inc-rename" },
    },
    cmd = "IncRename",
  },
  {
    "simrat39/rust-tools.nvim",
    opts = true,
  },
}
