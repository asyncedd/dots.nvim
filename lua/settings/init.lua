local M = {}

M.UI = {
  colorscheme = {
    -- name = "onedarkpro",
    -- name = "material",
    name = "astrotheme",
    -- name = "kanagawa",
    -- name = "catppuccin",
    -- name = "tokyonight",
    themes = {
      -- { import = "plugins.specs.themes.onedarkpro" },
      -- { import = "plugins.specs.themes.material" },
      { import = "plugins.specs.themes.astrotheme" },
      -- { import = "plugins.specs.themes.kanagawa" },
      -- { import = "plugins.specs.themes.catppuccin" },
      -- { import = "plugins.specs.themes.tokyonight" },
    },
  },
  icons = {
    LSP = {
      diagnostics = {
        Error = " ",
        Warn = " ",
        Hint = "󰌵 ",
        Info = " ",
      },
      kind = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
        Codeium = "",
        TabNine = "",
      },
    },
    buffers = {
      readonly = "󰌾 ",
      modified = "● ",
      unsaved_others = "○ ",
    },
  },
}

_G.dots = M

return M
