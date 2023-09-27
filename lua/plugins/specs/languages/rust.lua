return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        rust_analyzer = {},
      },
    },
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
  },
}
