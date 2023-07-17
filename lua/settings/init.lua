local M = {}

M.lazy = {
  defaults = {
    lazy = true,
  },
  default_to_current_colorscheme = true,
}

M.UI = {
  icons = {
    LSP = {
      Error = " ",
      Warn = " ",
      Hint = "󱧡 ",
      Info = " ",
    },
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
    Codeium = "",
    TabNine = "",
  },
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
      },
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
  config = {
    enabled = true,
    opts = {
      servers_to_not_setup = {},
      servers = {},
      setup = {},
    },
    specs = {
      {
        "neovim/nvim-lspconfig",
      },
    },
  },
  null = {
    enabled = true,
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
    ghost_text = true,
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
    snippets = {
      friendly_snippets = true,
    },
    specs = {
      {
        "L3MON4D3/LuaSnip",
      },
    },
  },
}

_G.dots = M
