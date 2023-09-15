return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers_to_not_setup = {},
      servers = {},
      setup = {},
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("plugins.configs.lsp.config")(opts)
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          {
            "williamboman/mason.nvim",
            opts = true,
          },
        },
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = {
      sources = {},
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("plugins.configs.lsp.null")(opts)
    end,
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    config = function()
      local g = vim.g

      g.code_action_menu_show_details = true
      g.code_action_menu_show_diff = true
      g.code_action_menu_show_action_kind = true
    end,
    keys = {
      { "<leader>ca", "<cmd>CodeActionMenu<CR>", desc = "Open the code action menu" },
    },
  },
  {
    "kosayoda/nvim-lightbulb",
    opts = {
      priority = 40,
      autocmd = {
        enabled = true,
      },
    },
    event = "LspAttach",
  },
}
