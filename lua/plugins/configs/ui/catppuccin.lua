return {
  custom_highlights = function(C)
    local utils = require("catppuccin.utils.colors")
    local tint = function(tint)
      return utils.blend(tint, C.base, 0.2)
    end

    local U = require("catppuccin.utils.colors")
    return {
      -- General
      Search = { bg = C.surface1, fg = C.sky, style = { "bold" } }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
      IncSearch = { bg = C.sky, fg = C.surface1 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      Pmenu = { bg = C.mantle },
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

      -- kind support
      CmpItemKindField = { fg = C.rosewater, bg = tint(C.rosewater) },
      CmpItemKindProperty = { fg = C.rosewater, bg = tint(C.rosewater) },
      CmpItemKindEvent = { fg = C.rosewater, bg = tint(C.rosewater) },

      CmpItemKindText = { fg = C.green, bg = tint(C.green) },
      CmpItemKindModule = { fg = C.text, bg = tint(C.text) },
      CmpItemKindVariable = { fg = C.rosewater, bg = tint(C.rosewater) },
      CmpItemKindUnit = { fg = C.text, bg = tint(C.text) },
      CmpItemKindValue = { fg = C.text, bg = tint(C.text) },

      CmpItemKindEnum = { fg = C.yellow, bg = tint(C.yellow) },
      CmpItemKindReference = { fg = C.yellow, bg = tint(C.yellow) },
      CmpItemKindClass = { fg = C.yellow, bg = tint(C.yellow) },
      CmpItemKindFolder = { fg = C.yellow, bg = tint(C.yellow) },
      CmpItemKindEnumMember = { fg = C.yellow, bg = tint(C.yellow) },
      CmpItemKindInterface = { fg = C.yellow, bg = tint(C.yellow) },

      CmpItemKindKeyword = { fg = C.mauve, bg = tint(C.mauve) },

      CmpItemKindConstant = { fg = C.peach, bg = tint(C.peach) },

      CmpItemKindConstructor = { fg = C.lavender, bg = tint(C.lavender) },

      CmpItemKindFunction = { fg = C.blue, bg = tint(C.blue) },
      CmpItemKindMethod = { fg = C.blue, bg = tint(C.blue) },

      CmpItemKindStruct = { fg = C.teal, bg = tint(C.teal) },
      CmpItemKindOperator = { fg = C.teal, bg = tint(C.teal) },

      CmpItemKindSnippet = { fg = C.flamingo, bg = tint(C.flamingo) },

      CmpItemKindFile = { fg = C.sky, bg = tint(C.sky) },

      CmpItemKindColor = { fg = C.pink, bg = tint(C.pink) },
      CmpItemKindTypeParameter = { fg = C.maroon, bg = tint(C.maroon) },

      CmpItemKindCodeium = { fg = C.green, bg = tint(C.green) },
      CmpItemKindTabNine = { fg = C.lavender, bg = tint(C.lavender) },

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
      TelescopePromptTitle = { fg = C.surface0, bg = C.sky },
      TelescopeResultsTitle = { fg = C.mantle, bg = C.mauve },
      TelescopePreviewTitle = { fg = C.crust, bg = C.green },

      -- Illumiate
      IlluminatedWordText = { bg = U.darken(C.surface1, 0.7, C.base) },
      IlluminatedWordRead = { bg = U.darken(C.surface1, 0.7, C.base) },
      IlluminatedWordWrite = { bg = U.darken(C.surface1, 0.7, C.base) },

      -- Indentscope
      MiniIndentscopeSymbol = { fg = utils.blend(C.sky, C.base, 0.3) },

      -- Semantic tokens

      ["@lsp.type.interface"] = { fg = C.flamingo },
      -- Semantic tokens
      ["@class"] = {},
      ["@struct"] = {},
      ["@enum"] = {},
      ["@enumMember"] = {},
      ["@event"] = {},
      ["@interface"] = {},
      ["@modifier"] = {},
      ["@regexp"] = {},
      ["@typeParameter"] = {},
      ["@decorator"] = {},

      -- Language spectific
      -- bash
      ["@function.builtin.bash"] = { fg = C.red, style = { "italic" } },

      -- java
      ["@constant.java"] = { fg = C.teal },

      ["@constructor.lua"] = { fg = C.flamingo }, -- For constructor calls and definitions: = { } in Lua.
      ["@field.lua"] = { fg = C.lavender },

      -- C/CPP
      ["@type.builtin.c"] = { style = {} },
      ["@property.cpp"] = { fg = C.text },
      ["@type.builtin.cpp"] = { style = {} },

      -- Misc
      gitcommitSummary = { fg = C.rosewater, style = { "italic" } },
      zshKSHFunction = { link = "Function" },

      -- Lazy.nvim
      LazyH1 = { bg = C.sky, fg = C.crust, style = { "bold", "italic" } },

      -- Leap
      LeapBackdrop = { link = "Comment" },
      LeapMatch = { fg = C.sky, style = { "bold", "nocombine" } },
      LeapLabelPrimary = { fg = C.blue, style = { "bold", "nocombine" } },
      LeapLabelSecondary = { fg = C.sapphire, style = { "bold", "nocombine" } },

      -- Harpoon
      HarpoonWindow = { fg = C.text, bg = C.mantle },
      HarpoonBorder = { fg = C.mantle, bg = C.mantle },

      -- Killersheep
      introHL = { fg = C.teal, style = { "bold" } },
      KillerBlood = { fg = C.red },
      killerCannon = { fg = C.blue },
      killerBullet = { bg = C.red },
      KillerSheep = { fg = C.green },
      KillerSheep2 = { fg = C.cyan },
      KillerPoop = { bg = C.text, fg = C.text },
      KillerLevel = { bg = C.blue, fg = C.text },
      KillerLevelX = { bg = C.yellow, fg = C.blue },

      -- Alpha
      StartLogo1 = { fg = C.blue },
      StartLogo2 = { fg = C.blue },
      StartLogo3 = { fg = C.blue },
      StartLogo4 = { fg = C.blue },
      StartLogo5 = { fg = C.blue },
      StartLogo6 = { fg = C.yellow },
      StartLogo7 = { fg = C.yellow },
      StartLogo8 = { fg = C.yellow },
    }
  end,
  integrations = {
    cmp = true,
    dashboard = false,
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
    integration = {
      dap = {
        enabled = true,
        enable_ui = true, -- enable nvim-dap-ui
      },
    },
  },
  -- compile_path = nil,
}
