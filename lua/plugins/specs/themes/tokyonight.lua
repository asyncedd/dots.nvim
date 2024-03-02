return {
  "folke/tokyonight.nvim",
  opts = {
    on_highlights = function(hl, c)
      local prompt = "#2d3149"
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopePromptNormal = {
        bg = prompt,
      }
      hl.TelescopePromptBorder = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePromptTitle = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }

      hl.RainbowRed = { fg = c.red }
      hl.RainbowYellow = { fg = c.yellow }
      hl.RainbowBlue = { fg = c.blue }
      hl.RainbowOrange = { fg = c.orange }
      hl.RainbowGreen = { fg = c.green }
      hl.RainbowViolet = { fg = c.purple }
      hl.RainbowCyan = { fg = c.cyan }
    end,
  },
  event = "CmdlineEnter",
}
