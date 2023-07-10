return {
  color_overrides = {
    mocha = {
      text = "#D9E0EE",
      subtext1 = "#BAC2DE",
      subtext0 = "#A6ADC8",
      overlay2 = "#C3BAC6",
      overlay1 = "#988BA2",
      overlay0 = "#6E6C7E",
      surface2 = "#6E6C7E",
      surface1 = "#575268",
      surface0 = "#302D41",

      base = "#1E1E2E",
      mantle = "#1A1826",
      crust = "#161320",
    },
  },
  custom_highlights = function(C)
    local U = require("core.utils.colors")
    return {
      -- General
      Search = { bg = C.surface1, fg = C.sky, style = { "bold" } }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
      IncSearch = { bg = C.sky, fg = C.surface1 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      Pmenu = { bg = C.mantle },
      MatchParen = { fg = C.peach, bg = "", style = { "bold" } },
      FloatBorder = { fg = C.mantle, bg = C.mantle },
      -- Treesitter
      ["@variable"] = { fg = C.flamingo },
      ["@float"] = { link = "Float" }, -- For floats.
      ["@function.call"] = { link = "Function" }, -- function calls
      ["@method"] = { link = "Function" }, -- For method calls and definitions.
      ["@method.call"] = { link = "Function" }, -- method calls
      ["@constant"] = { link = "Constant" }, -- For constants

      -- Cmp
      CmpItemAbbr = { fg = C.overlay2 },
      CmpItemAbbrDeprecated = { fg = C.overlay0, style = { "strikethrough" } },
      CmpItemKind = { fg = C.blue },
      CmpItemMenu = { fg = C.text },
      CmpItemAbbrMatch = { fg = C.sky, style = { "bold" } },
      CmpItemAbbrMatchFuzzy = { fg = C.sky, style = { "bold" } },
      PmenuSel = { bg = C.sky, fg = C.mantle, style = { "bold" } },
      CmpItemKindCodeium = { fg = C.green },

      -- Telescope
      TelescopeMatching = { fg = C.sky },
      TelescopeSelection = { bg = C.surface0 },
      TelescopePromptCounter = { fg = C.mauve, style = { "bold" } },
      TelescopePromptPrefix = { bg = C.surface0 },
      TelescopePromptNormal = { bg = C.surface0 },
      TelescopeResultsNormal = { bg = C.mantle },
      TelescopePreviewNormal = { bg = C.crust },
      TelescopePromptBorder = { bg = C.surface0, fg = C.surface0 },
      TelescopeResultsBorder = { bg = C.mantle, fg = C.mantle },
      TelescopePreviewBorder = { bg = C.crust, fg = C.crust },
      TelescopePromptTitle = { fg = C.surface0, bg = C.mauve },
      TelescopeResultsTitle = { fg = C.mantle, bg = C.mantle },
      TelescopePreviewTitle = { fg = C.crust, bg = C.green },

      -- Illumiate
      IlluminatedWordText = { bg = U.darken(C.surface1, 0.7, C.base) },
      IlluminatedWordRead = { bg = U.darken(C.surface1, 0.7, C.base) },
      IlluminatedWordWrite = { bg = U.darken(C.surface1, 0.7, C.base) },

      -- Indentscope
      MiniIndentscopeSymbol = { fg = C.sky },

      -- Flash
      FlashMatch = { fg = C.sky, style = { "bold", "nocombine" } },
      FlashCurrent = { fg = C.pink, style = { "bold", "nocombine" } },
      FlashLabel = { fg = C.mauve, style = { "bold", "nocombine" } },
    }
  end,
  integrations = {
    cmp = true,
    dashboard = false,
    alpha = false,
    gitsigns = true,
    nvimtree = false,
    telescope = false,
    treesitter = true,
    ts_rainbow = false,
    ts_rainbow2 = false,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
    dap = {
      enabled = true,
      enable_ui = true, -- enable nvim-dap-ui
    },
    notify = true,
    dropbar = {
      enabled = true,
      color_mode = true, -- enable color for kind's texts, not just kind's icons
    },
    rainbow_delimiters = dots.UI.rainbow_delimiters,
  },
  -- compile_path = nil,
}
