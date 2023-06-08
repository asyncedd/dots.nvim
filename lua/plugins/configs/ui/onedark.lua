return {
  colors = {
    dark = {
      telescope_prompt = "require('onedarkpro.helpers').darken('bg', 1, 'onedark')",
      telescope_results = "require('onedarkpro.helpers').darken('bg', 4, 'onedark')",
      telescope_preview = "require('onedarkpro.helpers').darken('bg', 6, 'onedark')",
      telescope_selection = "require('onedarkpro.helpers').darken('bg', 8, 'onedark')",

      illuminate = "require('onedarkpro.helpers').lighten('bg', 7, 'onedark')",
    },
    light = {
      telescope_prompt = "require('onedarkpro.helpers').darken('bg', 2, 'onelight')",
      telescope_results = "require('onedarkpro.helpers').darken('bg', 5, 'onelight')",
      telescope_preview = "require('onedarkpro.helpers').darken('bg', 7, 'onelight')",
      telescope_selection = "require('onedarkpro.helpers').darken('bg', 9, 'onelight')",

      illuminate = "require('onedarkpro.helpers').darken('bg', 7, 'onelight')",
    },
  },
  highlights = {
    -- CMP
    CmpItemKindCodeium = { fg = "${green}" },
    CmpItemKindTabNine = { fg = "${purple}" },

    -- Telescope
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

    -- Leap
    LeapBackdrop = { link = "Comment" },
    LeapMatch = {
      fg = "${blue}",
    },
    LeapLabelPrimary = {
      fg = "${red}",
    },
    LeapLabelSecondary = {
      fg = "${green}",
    },

    -- PMenu
    PmenuSel = {
      bg = "${blue}",
      fg = "${black}",
    },

    -- Illuminate
    IlluminatedWordText = {
      bg = "${illuminate}",
    },

    IlluminatedWordRead = {
      bg = "${illuminate}",
    },

    IlluminatedWordWrite = {
      bg = "${illuminate}",
    },

    MiniIndentscopeSymbol = {
      fg = "${blue}",
    },

    FloatBorder = {
      fg = "${black}",
      bg = "${black}",
    },

    StartLogo1 = { fg = "#94E2D5" },
    StartLogo2 = { fg = "#A2DDD8" },
    StartLogo3 = { fg = "#B0D9DA" },
    StartLogo4 = { fg = "#BED4DD" },
    StartLogo5 = { fg = "#CBD0DF" },
    StartLogo6 = { fg = "#D9CBE2" },
    StartLogo7 = { fg = "#E7C7E4" },
    StartLogo8 = { fg = "#F5C2E7" },
  },
  plugins = {
    polygot = false,
    neo_tree = false,
    neotest = false,
    vim_ultest = false,
    startify = false,
    packer = false,
    nvim_ts_rainbow = false,
    nvim_ts_rainbow2 = false,
  },
}
