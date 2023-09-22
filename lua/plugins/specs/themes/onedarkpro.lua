return {
  "olimorris/onedarkpro.nvim",
  opts = function()
    return {
      colors = {
        dark = {
          bg = "#23272e",
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
}
