local M = {}

-- It can be catppuccin, tokyonight, nightfox, or onedarkpro
M.colorscheme = "catppuccin"

M.tokyonight = {
  -- Storm, Night, Moon or Day
  style = "moon",
}

M.filetypes = {
  lua = true,
  typescript = true,
  svelte = true,
  fish = true,
  rust = true,
  markdown = true,
  shell = false,
}

_G.config = M

return M
