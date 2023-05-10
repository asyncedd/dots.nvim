return {
  custom_highlights = function(C)
    local utils = require("catppuccin.utils.colors")
    local tint = function(tint)
      return utils.blend(tint, C.base, 0.2)
    end

    local U = require("catppuccin.utils.colors")
    return {
      -- General
      Search = { bg = C.surface1, fg = C.pink, style = { "bold" } }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
      IncSearch = { bg = C.pink, fg = C.surface1 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"

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
  },
  -- compile_path = nil,
}
