return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      scope = {
        highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        },
      },
      indent = {
        highlight = "IndentBlanklineChar",
      },
    },
    config = function(_, opts)
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      require("ibl").setup(opts)
    end,
    event = { "User LazyFile" },
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "",
    },
    keys = {
      { "ai", mode = { "x", "o" } },
      { "ii", mode = { "x", "o" } },
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function()
      return require("plugins.configs.ui.heirline")
    end,
    event = { "User LazyFile", "BufReadPost" },
    dependencies = "nvim-web-devicons",
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = false,
      },
    },
    keys = {
      { "]b", "<cmd>BufferLineCycleNext<CR>", desc = "bufferline: cycle next" },
      { "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "bufferline: cycle prev" },

      { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "bufferline: cycle next" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "bufferline: cycle prev" },
    },
    init = function()
      if vim.fn.argc() > 1 then
        require("bufferline")
      end
    end,
    event = { "BufAdd", "TabNew" },
  },
  {
    "rcarriga/nvim-notify",
    opts = function()
      return require("plugins.configs.ui.notify")
    end,
    config = function()
      vim.notify = require("notify")
    end,
    init = function()
      vim.notify = function(...)
        if not require("lazy.core.config").plugins["nvim-notify"]._.loaded then
          require("lazy").load({ plugins = "nvim-notify" })
        end
        require("notify")(...)
      end
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      cmdline = {
        view = "cmdline",
      },
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
      routes = {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = {
          skip = true,
        },
      },
    },
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  -- CREDITS TO: https://www.lazyvim.org/plugins/ui#dressingnvim
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
}
