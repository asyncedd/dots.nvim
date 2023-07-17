return not dots.treesitter and {}
  or {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        auto_install = true,
        ensure_installed = {},
        highlight = {
          enable = true,
        },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
      event = {
        "BufRead",
        "BufWinEnter",
        "BufNewFile",
      },
    },
  }
