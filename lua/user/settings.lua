local M = {}

-- What colorscheme to use.
M.colorscheme = "catppuccin"

-- Neovim's builtin RTP plugin stuff.
M.builtins = {
  -- "disable" builtin RTP plugins via "vim.g.loaded_"
  fake_load = true,
  -- Actually disable builtin RTP plugins via lazy.nvim
  disable = true,
}

M.plugins = {
  -- Whether or not to have plugins.
  enable = true,
  -- When installing plugins via lazy, colorschemes aren't loaded whilst installing a plugin.
  -- So, list some colorschemes to try to get lazy.nvim to load. (in order.)
  installColors = {
    "catppuccin",
    "tokyonight",
    "kanagawa",
    "habamax",
  },
}

M.cache = {
  -- Whether or not to have cache.
  -- You should not enable this if you're not nvim v9+
  -- As, vim.loader isn't in core in v8
  enable = true,
}

return M
