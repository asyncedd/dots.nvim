return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    config = function()
      require("lspconfig").rust_analyzer.setup({
        capabilities = require("plugins.configs.lsp.config").capabilities,
        settings = {
          ["rust-analyzer"] = {
            argo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            check = {
              command = "clippy",
              allFeatures = true,
              extraArgs = {
                "--",
                "-W clippy::pedantic",
                "-W clippy::nursery",
                "-W clippy::unwrap_used",
                "-W clippy::expect_used",
              },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      })
    end,
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = true,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
      },
    },
  },
}
