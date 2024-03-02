return {
  "catppuccin/nvim",
  opts = {
    custom_highlights = function(C)
      return {
        RainbowRed = { fg = C.red },
        RainbowYellow = { fg = C.yellow },
        RainbowBlue = { fg = C.blue },
        RainbowOrange = { fg = C.peach },
        RainbowGreen = { fg = C.green },
        RainbowViolet = { fg = C.mauve },
        RainbowCyan = { fg = C.teal },

        IndentBlanklineChar = { link = "IblIndent" },
      }
    end,
    integrations = {
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      indent_blankline = {
        enabled = true,
        -- scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = true,
      },
    },
  },
  name = "catppuccin",
  event = "CmdlineEnter",
}
