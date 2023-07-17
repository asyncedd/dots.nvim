local M = {}

M.lazy = {
  defaults = {
    lazy = true,
  },
  default_to_current_colorscheme = true,
}

M.UI = {
  icons ={
    LSP = {
      Error = " ",
      Warn = " ",
      Hint = "󱧡 ",
      Info = " ",
    }
  }
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
      neodev = {
        enable = true,
        opts = {
          library = {
            plugins = false,
          },
        },
      }
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

M.coding = {
  enabled = true,
  cmp = {
    enabled = true,
    sources = {
      luasnip = true,
      buffer = true,
      path = true,
      lsp = true,
    },
    snippet = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
    specs = {
      {
        "hrsh7th/nvim-cmp",
      },
    },
  },
  luasnip = {
    enabled = true,
    specs = {
      {
        "L3MON4D3/LuaSnip",
      },
    },
  },
}

_G.dots = M
