require("catppuccin").setup({
  custom_highlights = function(cp)
    return {
      NormalFloat = { bg = cp.crust },
      FloatBorder = { bg = cp.crust, fg = cp.crust },
      VertSplit = { bg = cp.base, fg = cp.surface0 },
      CursorLineNr = { fg = cp.mauve, style = { "bold" } },
      Pmenu = { bg = cp.crust, fg = "" },
      PmenuSel = { bg = cp.surface0, fg = "" },

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
      -- IndentBlanklineChar = { fg = colors.surface0 },
      -- IndentBlanklineContextChar = { fg = colors.surface2 },
      GitSignsChange = { fg = cp.peach },
      -- NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
      NvimTreeExecFile = { fg = cp.text },
    }
  end,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = { "bold" },
    functions = { "bold" },
    keywords = { "bold" },
    strings = {},
    variables = {},
    numbers = { "bold" },
    booleans = { "bold" },
    properties = {},
    types = { "bold" },
    operators = {},
  },
  integrations = {
    mini = true,
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
        hints = { "underline" },
        warnings = { "undercurl" },
        information = { "underline" },
      },
    },
    cmp = true,
  },
  compile = {
    enabled = true,
  }
})

