return {
  "marko-cerovac/material.nvim",
  opts = function()
    local C = require("material.colors")
    return {
      custom_highlights = {
        RainbowRed = { fg = C.main.red },
        RainbowYellow = { fg = C.main.yellow },
        RainbowBlue = { fg = C.main.blue },
        RainbowOrange = { fg = C.main.orange },
        RainbowGreen = { fg = C.main.green },
        RainbowViolet = { fg = C.main.purple },
        RainbowCyan = { fg = C.main.cyan },
      },
      plugins = {
        "gitsigns",
        "indent-blankline",
        "mini",
        "nvim-cmp",
        "nvim-web-devicons",
        "telescope",
      },
    }
  end,
}
