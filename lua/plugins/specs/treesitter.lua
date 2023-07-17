return not dots.treesitter and {} or {
  dots.treesitter.specs,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {},
      highlight = {
        enabled = true,
      }
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
    end,
    event = {
      "BufRead", "BufWinEnter", "BufNewFile"
    },
  },
}
