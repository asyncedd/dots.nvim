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
}

M.treesitter = {
  enabled = true,
  provider = "nvim-treesitter",
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
      { name = "luasnip", source = "saadparwaiz1/cmp_luasnip" },
      { name = "nvim_lsp", source = "hrsh7th/cmp-nvim-lsp" },
      { name = "buffer", source = "hrsh7th/cmp-buffer" },
      { name = "path", source = "hrsh7th/cmp-path" },
    },
    ghost_text = true,
    snippet = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  luasnip = {
    enabled = true,
    snippets = {
      friendly_snippets = true,
    },
  },
  ultimate_autopairs = {
    enabled = true,
  },
  comment = {
    enabled = true,
  },
}

_G.dots = M
