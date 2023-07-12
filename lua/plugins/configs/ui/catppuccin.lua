return {
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

      DiagnosticVirtualTextError = {
        bg = C.none,
      }, -- Used as the mantle highlight group. Other Diagnostic highlights link to this by default
      DiagnosticVirtualTextWarn = {
        bg = C.none,
      }, -- Used as the mantle highlight group. Other Diagnostic highlights link to this by default
      DiagnosticVirtualTextInfo = {
        bg = C.none,
      }, -- Used as the mantle highlight group. Other Diagnostic highlights link to this by default
      DiagnosticVirtualTextHint = {
        bg = C.none,
      }, -- Used as the mantle highlight group. Other Diagnostic highlights link to this by default
    }
  end,
  integrations = {
    cmp = true,
    dashboard = false,
    alpha = false,
    gitsigns = true,
    nvimtree = false,
    telescope = {
      enbled = true,
      style = "nvchad",
    },
    treesitter = true,
    ts_rainbow = false,
    ts_rainbow2 = false,
    native_lsp = {
      enabled = true,
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
    mini = true,
  },
  -- compile_path = nil,
}
