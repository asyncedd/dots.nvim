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
      Warn = " ",
      Hint = "󰌵 ",
      Info = " ",
    },
    Git = {
      add = "",
      del = "",
      mod = "",
      Signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
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
      typescript = {
        -- This requires the Typescript intregation!
        enable = true,
      },
    },
    DAP = {
      enable = true,
    },
  },
  typescript = {
    enable = false,
    tools = {
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
    enable = false,
    treesitter = {
      base = true,
      ninja = false,
      rst = false,
      toml = false,
    },
    LSP = {
      config = {
        enable = true,
        servers = {
          pyright = {},
          ruff_lsp = {},
        },
      },
      null = {
        enable = true,
        servers = {
          black = {},
        },
      },
    },
    semshi = {
      enable = true,
    },
  },
  toml = {
    enable = false,
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
    enable = false,
    LSP = {
      config = {
        enable = true,
      },
    },
  },
  go = {
    enable = false,
    LSP = {
      config = {
        enable = true,
        servers = {
          gopls = {},
        },
      },
      null = {
        enable = true,
        sources = {
          gofumpt = {},
          goimports_reviser = {},
          golines = {},
        },
      },
    },
  },
  html = {
    enable = false,
    LSP = {
      config = {
        enable = true,
        servers = {
          html = {},
        },
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
    opts = {
      servers_to_not_setup = {},
      servers = {},
      setup = {},
    },
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
  autotag = {
    ft = {
      "svelte",
      "html",
    },
  },
}

M.editor = {
  enabled = true,
  treesitter = {
    parsers = {},
  },
}

M.tools = {
  enabled = true,
}

M.DAP = {
  enabled = true,
}

_G.dots = M
