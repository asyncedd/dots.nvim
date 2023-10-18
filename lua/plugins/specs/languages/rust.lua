return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
                extraArgs = {
                  "--",
                  "-W clippy::pedantic",
                  "-W clippy::nursery",
                  "-W clippy::unwrap_used",
                  "-W clippy::expect_used",
                },
              },
            },
          },
        },
      },
    },
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
