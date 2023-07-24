local M = {}

M.lazy = {
  defaults = {
    lazy = true,
  },
  default_to_current_colorscheme = true,
}

M.UI = {
  notify = {
    enabled = true,
  },
  noice = {
    enabled = true,
  },
  icons = {
    LSP = {
      Error = " ",
      Warn = " ",
      Hint = "󰌵 ",
      Info = " ",
    },
    Git = {
      add = "",
      del = "",
      mod = "",
      Signs = {
        add = "▎",
        change = "▎",
        delete = "",
        topdelete = "",
        changedelete = "▎",
        untracked = "▎",
      },
    },
    Folds = {
      eob = " ",
      fold = " ",
      foldopen = "",
      foldsep = " ",
      foldclose = "",
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
    DAP = {
      enabled = true,
    },
  },
  svelte = {
    enable = true,
    treesitter = {
      base = true,
      javascript = true,
      typescript = true,
      rust = false,
      css = true,
    },
    LSP = {
      enable = true,
      servers = {
        svelte = {},
        emmet_ls = {},
        tailwindcss = {},
      },
    },
    DAP = {
      enable = true,
    },
  },
  markdown = {
    enable = true,
    treesitter = {
      markdown = true,
      markdown_inline = true,
      additional_parsers = {},
    },
    LSP = {
      enable = true,
      providers = {
        marksman = {},
        -- You can add more servers as you please.
        -- prosemd = {}
      },
    },
  },
  python = {
    enable = true,
    treesitter = {
      base = true,
    },
    LSP = {
      config = {
        enable = true,
        servers = {
          pyright = {},
        },
      },
      null = {
        enable = true,
        servers = {
          ruff = {},
          black = {},
        },
      },
    },
  },
  toml = {
    enable = true,
    LSP = {
      null = {
        enable = true,
      },
      config = {
        enable = true,
        servers = {
          taplo = {},
        },
      },
    },
  },
  rust = {
    enable = true,
    LSP = {
      config = {
        enable = true,
      },
    },
  },
}

M.colorscheme = {
  enabled = "catppuccin",
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
  on_attach = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint(bufnr, true)
        end
      end,
    })
  end,
}

M.coding = {
  enabled = true,
  cmp = {
    enabled = true,
    sources = {
      { name = "emoji", source = "hrsh7th/cmp-emoji", priority = 99999 },
      { name = "luasnip", source = "saadparwaiz1/cmp_luasnip" },
      { name = "nvim_lsp", source = "hrsh7th/cmp-nvim-lsp" },
      { name = "buffer", source = "hrsh7th/cmp-buffer" },
      { name = "path", source = "hrsh7th/cmp-path" },
    },
    cmd = {
      enabled = true,
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
  autotag = {
    enabled = true,
    ft = {
      "svelte",
    },
  },
  dial = {
    enabled = true,
  },
}

M.editor = {
  enabled = true,
  spider = {
    enabled = true,
  },
  textobjs = {
    enabled = true,
  },
  surround = {
    enabled = true,
  },
  flash = {
    enabled = true,
  },
  gitsigns = {
    enabled = true,
  },
  illuminate = {
    enabled = true,
  },
  treesitter = {
    enabled = true,
    parsers = {},
  },
  undotree = {
    enabled = true,
  },
}

M.tools = {
  enabled = true,
  telescope = {
    enabled = true,
  },
}

M.DAP = {
  enabled = true,
  UI = {
    enabled = true,
  },
  virtual = {
    enabled = true,
  },
}

_G.dots = M
