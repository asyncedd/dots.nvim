return {
  custom_highlights = function(C)
    local utils = require("catppuccin.utils.colors")
    local tint = function(tint)
      return utils.blend(tint, C.base, 0.2)
    end

    local U = require("catppuccin.utils.colors")
    return {
      -- Treesitter
      ["@variable"] = { fg = C.flamingo },

      -- Cmp
      CmpItemAbbr = { fg = C.overlay2 },
      CmpItemAbbrDeprecated = { fg = C.overlay0, style = { "strikethrough" } },
      CmpItemKind = { fg = C.blue },
      CmpItemMenu = { fg = C.text },
      CmpItemAbbrMatch = { fg = C.pink, style = { "bold" } },
      CmpItemAbbrMatchFuzzy = { fg = C.pink, style = { "bold" } },

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
      TelescopeSelection = { bg = C.surface0 },
      TelescopePromptCounter = { fg = C.mauve, style = { "bold" } },
      TelescopePromptPrefix = { bg = C.surface0 },
      TelescopePromptNormal = { bg = C.surface0 },
      TelescopeResultsNormal = { bg = C.mantle },
      TelescopePreviewNormal = { bg = C.crust },
      TelescopePromptBorder = { bg = C.surface0, fg = C.surface0 },
      TelescopeResultsBorder = { bg = C.mantle, fg = C.mantle },
      TelescopePreviewBorder = { bg = C.crust, fg = C.crust },
      TelescopePromptTitle = { fg = C.surface0, bg = C.surface0 },
      TelescopeResultsTitle = { fg = C.mantle, bg = C.mantle },
      TelescopePreviewTitle = { fg = C.crust, bg = C.crust },

      -- Illumiate
      IlluminatedWordText = { bg = U.darken(C.surface1, 0.7, C.base) },
      IlluminatedWordRead = { bg = U.darken(C.surface1, 0.7, C.base) },
      IlluminatedWordWrite = { bg = U.darken(C.surface1, 0.7, C.base) },

      -- Indentscope
      MiniIndentscopeSymbol = { fg = tint(C.sky) },
    }
  end,
  -- compile_path = nil,
}
