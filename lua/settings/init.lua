local M = {}

M.sqlite = {
	 path = vim.env.sqlite_nix_path,
}

M.Editor = {
  Treesitter = {
    -- if false it would use curl instead of git
    prefer_git = true,
  },
}

M.UI = {
  colorscheme = {
    --- BETA: You can use functions that returns a string to determine the colorscheme as well!
    -- value = function()
    --   return "onedark"
    -- end,
    value = "onedark",
    -- value = "material",
    -- value = "astrotheme",
    -- value = "kanagawa",
    -- value = "catppuccin",
    -- value = "tokyonight",
    themes = {
      { import = "plugins.specs.themes.onedarkpro" },
      -- { import = "plugins.specs.themes.material" },
      -- { import = "plugins.specs.themes.astrotheme" },
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
    Git = {
      added = " ",
      remove = " ",
      changed = "󰣕 ",
    },
    Gitsigns = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
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
    -- { import = "plugins.specs.languages.c" },
    -- { import = "plugins.specs.languages.fish" },
    -- { import = "plugins.specs.languages.haskell" },
    -- { import = "plugins.specs.languages.toml" },
  },
}

_G.dots = M

return M
