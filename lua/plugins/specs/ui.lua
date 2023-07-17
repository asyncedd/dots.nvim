return {
  {
    "catppuccin/nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", {
        custom_highlights = function(C)
          return {
            ["@variable"] = { fg = C.flamingo },
            Pmenu = { bg = C.mantle },
          }
        end,
      }, opts)
    end,
    name = "catppuccin",
  },
  dots.UI.notify.enabled and {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
    event = "UIEnter",
  },
  dots.UI.noice.enabled and {
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
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      cmdline = {
        view = "cmdline",
      },
    },
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
}
