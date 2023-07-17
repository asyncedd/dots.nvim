local M = {}

M.lazy = {
  defaults = {
    lazy = true,
  }
}

M.colorscheme = {
  enabled = "catppuccin",
  specs = {
    {
      "catppuccin/nvim",
    },
  },
}

_G.dots = M
