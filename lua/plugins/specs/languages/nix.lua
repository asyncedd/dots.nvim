return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, {
        "nix",
      })
    end,
  },
  {
    "LnL7/vim-nix",
    ft = {
      "nix",
    },
  },
}
