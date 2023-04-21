require("catppuccin").setup({
  dim_inactive = {
    enabled = true,
  },
  custom_highlights = function(cp)
    return {
      -- NormalFloat = { bg = cp.crust },
      -- FloatBorder = { bg = cp.crust, fg = cp.crust }, VertSplit = { bg = cp.base, fg = cp.surface0 },
      CursorLineNr = { fg = cp.mauve, style = { "bold" } },
      Pmenu = { bg = cp.crust, fg = "" },

      TelescopeSelection = { bg = cp.surface0 },
      TelescopePromptCounter = { fg = cp.mauve, style = { "bold" } },
      TelescopePromptPrefix = { bg = cp.surface0 },
      TelescopePromptNormal = { bg = cp.surface0 },
      TelescopeResultsNormal = { bg = cp.mantle },
      TelescopePreviewNormal = { bg = cp.crust },
      TelescopePromptBorder = { bg = cp.surface0, fg = cp.surface0 },
      TelescopeResultsBorder = { bg = cp.mantle, fg = cp.mantle },
      TelescopePreviewBorder = { bg = cp.crust, fg = cp.crust },
      TelescopePromptTitle = { fg = cp.surface0, bg = cp.surface0 },
      TelescopeResultsTitle = { fg = cp.mantle, bg = cp.mantle },
      TelescopePreviewTitle = { fg = cp.crust, bg = cp.crust },
      -- IndentBlanklineChar = { fg = cp.surface0 },
      -- IndentBlanklineContextChar = { fg = cp.surface2 },
      -- GitSignsChange = { fg = cp.peach },
      -- NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
      -- NvimTreeExecFile = { fg = cp.text },

      ["@lsp.type.parameter"] = { fg = cp.red },
      ["@lsp.type.variable"] = { fg = cp.pink },
      ["@lsp.type.function"] = { fg = cp.blue },

      ["@variable"] = { fg = cp.pink },
    }
  end,
  integrations = {
    mini = true,
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "undercurl" },
        hints = { "underline" },
        warnings = { "undercurl" },
        information = { "underline" },
      },
    },
  },
})

