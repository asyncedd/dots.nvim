local M = {}

-- It can be catppuccin, tokyonight, nightfox, or onedarkpro
M.colorscheme = "catppuccin"

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

for _, plug in ipairs(plugs) do
  table.insert(ret, { plug, enabled = false })
end

plugs = ret

return plugs
