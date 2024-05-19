local M = {}

M.sqlite = {
  path = vim.env.sqlite_nix_path,
}

M.UI = {
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
    Git = {
      added = " ",
      changed = " ",
      remove = " ",
    },
    Gitsigns = {
      add = "▎",
      change = "▎",
      delete = "",
    },
  },
}

M.languages = {
  enable = {
    -- Use this to enable all language support.
    -- { import = "plugins.specs.languages" },
    { import = "plugins.specs.languages.lua" },
    { import = "plugins.specs.languages.svelte" },
    { import = "plugins.specs.languages.rust" },
    { import = "plugins.specs.languages.markdown" },
    { import = "plugins.specs.languages.css" },
    { import = "plugins.specs.languages.nix" },
    { import = "plugins.specs.languages.javascript" },
    -- { import = "plugins.specs.languages.dot" },
    -- { import = "plugins.specs.languages.c" },
    -- { import = "plugins.specs.languages.fish" },
    -- { import = "plugins.specs.languages.haskell" },
    -- { import = "plugins.specs.languages.toml" },
  },
}

M.goodies = {
  enable = {
    { import = "plugins.specs.goodies.telescope.diagnostics" },
  },
}

_G.dots = M

return M
