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
      }
    end,
    integrations = {
      telescope = {
        enabled = true,
        style = "nvchad",
      },
    },
  },
  name = "catppuccin",
}
