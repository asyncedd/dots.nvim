return {
  {
    "olimorris/onedarkpro.nvim",
    opts = function()
      return {
        colors = {
          dark = {
            telescope_prompt = "require('onedarkpro.helpers').darken('bg', 1, 'onedark')",
            telescope_results = "require('onedarkpro.helpers').darken('bg', 4, 'onedark')",
            telescope_preview = "require('onedarkpro.helpers').darken('bg', 6, 'onedark')",
            telescope_selection = "require('onedarkpro.helpers').lighten('bg', 8, 'onedark')",
          },
          light = {
            telescope_prompt = "require('onedarkpro.helpers').darken('bg', 2, 'onelight')",
            telescope_results = "require('onedarkpro.helpers').darken('bg', 5, 'onelight')",
            telescope_preview = "require('onedarkpro.helpers').darken('bg', 7, 'onelight')",
            telescope_selection = "require('onedarkpro.helpers').darken('bg', 9, 'onelight')",
          },
        },
        highlights = {
          TelescopeBorder = {
            fg = "${telescope_results}",
            bg = "${telescope_results}",
          },
          TelescopePromptBorder = {
            fg = "${telescope_prompt}",
            bg = "${telescope_prompt}",
          },
          TelescopePromptCounter = { fg = "${fg}" },
          TelescopePromptNormal = { fg = "${fg}", bg = "${telescope_prompt}" },
          TelescopePromptPrefix = {
            fg = "${purple}",
            bg = "${telescope_prompt}",
          },
          TelescopePromptTitle = {
            fg = "${telescope_prompt}",
            bg = "${purple}",
          },
          TelescopePreviewTitle = {
            fg = "${telescope_results}",
            bg = "${green}",
          },
          TelescopeResultsTitle = {
            fg = "${telescope_results}",
            bg = "${telescope_results}",
          },
          TelescopeMatching = { fg = "${blue}" },
          TelescopeNormal = { bg = "${telescope_results}" },
          TelescopeSelection = { bg = "${telescope_selection}" },
          TelescopePreviewNormal = { bg = "${telescope_preview}" },
          TelescopePreviewBorder = { fg = "${telescope_preview}", bg = "${telescope_preview}" },
          RainbowRed = { fg = "${red}" },
          RainbowYellow = { fg = "${yellow}" },
          RainbowBlue = { fg = "${blue}" },
          RainbowOrange = { fg = "${orange}" },
          RainbowGreen = { fg = "${green}" },
          RainbowViolet = { fg = "${purple}" },
          RainbowCyan = { fg = "${cyan}" },

          PmenuSel = { bg = "${blue}", fg = "${bg}" },
        },
        options = {
          bold = true,
          italic = true,
          undercurl = true,
          window_unfocussed_color = true,
        },
        styles = {
          comments = "italic",
          keywords = "italic",
        },
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    branch = "v3",
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
    event = "BufReadPost",
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
    event = "BufReadPost",
    dependencies = "nvim-web-devicons",
  },
  {
    "echasnovski/mini.animate",
    opts = {
      scroll = {
        enable = false,
      },
    },
    event = "VeryLazy",
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
    },
    init = function()
      if vim.fn.argc() > 1 then
        require("bufferline")
      end
    end,
    event = "VeryLazy",
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
    },
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
