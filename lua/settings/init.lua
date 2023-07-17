local M = {}

M.lazy = {
  defaults = {
    lazy = true,
  },
  default_to_current_colorscheme = true,
}

M.languages = {
  lua = {
    enable = true,
    treesitter = {
      base = true,
      luadoc = false,
      patterns = true,
    },
    LSP = {
      enable = true,
    },
  },
}

M.colorscheme = {
  enabled = "catppuccin",
  specs = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
    },
  },
}

M.treesitter = {
  enabled = true,
  provider = "nvim-treesitter",
  specs = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
    },
  },
}

M.LSP = {
  enabled = true,
  opts = {
    servers_to_not_setup = {},
    servers = {},
    setup = {},
  },
}

_G.dots = M
