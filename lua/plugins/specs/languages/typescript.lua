return not dots.languages.typescript.enable and {}
  or {
    {
      "pmizio/typescript-tools.nvim",
      opts = {},
      event = "VeryLazy",
      config = function(_, opts)
        require("typescript-tools").setup(opts)
        vim.cmd("silent! do FileType")
      end,
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers_to_not_setup = {
          "tsserver",
        },
        servers = {
          tsserver = {},
        },
      },
    },
  }
