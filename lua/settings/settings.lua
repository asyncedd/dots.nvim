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
  python = true,
  web = true,
  c = true,
  astro = true,
}

M.disabled_plugins = {
  "nvim-neo-tree/neo-tree.nvim",
}

dots = M

local plugs = M.disabled_plugins

local ret = {}

for i = 1, #plugs do
  local plugin = {
    plugs[i],
    enabled = false,
  }
  table.insert(ret, plugin)
end

plugs = ret

return plugs
