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
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)
      require("ibl").setup(opts)

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
    event = "BufReadPost",
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "",
    },
    event = "VeryLazy",
  },
  {
    "rebelot/heirline.nvim",
    opts = function()
      return require("plugins.configs.ui.heirline")
    end,
    event = "BufReadPost",
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
    init = function()
      if vim.fn.argc() > 1 then
        require("bufferline")
      end
    end,
    event = "VeryLazy",
  },
}
