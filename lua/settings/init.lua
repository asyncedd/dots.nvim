local M = {}

M.lazy = {
  defaults = {
    lazy = true,
    default_to_current_colorscheme = true,
  },
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
