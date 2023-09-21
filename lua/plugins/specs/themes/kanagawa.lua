return {
  "rebelot/kanagawa.nvim",
  opts = {
    compile = true,
    overrides = function()
      local colors = require("kanagawa.colors").setup()
      local C = colors.palette
      local T = colors.theme
      return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },

        RainbowRed = { fg = C.autumnRed },
        RainbowYellow = { fg = C.autumnYellow },
        RainbowBlue = { fg = C.crystalBlue },
        RainbowOrange = { fg = C.roninYellow },
        RainbowGreen = { fg = C.springGreen },
        RainbowViolet = { fg = C.oniViolet },
        RainbowCyan = { fg = C.waveAqua1 },

        TelescopeTitle = { fg = T.ui.special, bold = true },
        TelescopePromptNormal = { bg = T.ui.bg_p1 },
        TelescopePromptBorder = { fg = T.ui.bg_p1, bg = T.ui.bg_p1 },
        TelescopeResultsNormal = { fg = T.ui.fg_dim, bg = T.ui.bg_m1 },
        TelescopeResultsBorder = { fg = T.ui.bg_m1, bg = T.ui.bg_m1 },
        TelescopePreviewNormal = { bg = T.ui.bg_dim },
        TelescopePreviewBorder = { bg = T.ui.bg_dim, fg = T.ui.bg_dim },
      }
    end,
  },
  build = ":KanagawaCompile",
}
