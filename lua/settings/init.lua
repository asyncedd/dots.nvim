local M = {}

M.UI = {
  colorscheme = {
    name = "material",
    themes = {
      -- { import = "plugins.specs.themes.onedarkpro" },
      { import = "plugins.specs.themes.material" },
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
