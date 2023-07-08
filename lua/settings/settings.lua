-- WARNING: DO NOT REMOVE THE `local M = {}` OR THERE'LL BE SPOOKY ERRORS!
-- START
local M = {}
-- END

-- The colorscheme to use. It can be: [catppuccin, tokyonight, nightfox or onedarkpro]
--
-- TIP: Installed some other colorscheme? Will, just add it!
-- for eg. You can use the vim.cmd.colorscheme (:colorscheme) <name>
-- and just put the name below and it'll be used!
M.colorscheme = "catppuccin"

-- Language integration to use.
-- The filetypes below are the only supported ones for now.
-- For example to disable Lua integration change the `lua = true,` to `lua = false,`
-- FUN FACT: The language servers will still start so, make sure to go `:Mason` and uninstall them!
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

-- A list of plugins to disable.
-- You simply add plugins to disable, that's it!
-- (You might break things so beware)
M.disabled_plugins = {
  "nvim-neo-tree/neo-tree.nvim",
}

-- WARNING: DO NOT MODIFY STUFF UNDER THIS!
-- It'll lead to unexpected behavior!

dots = M

local plugs = M.disabled_plugins
local ret = {}

for _, plug in ipairs(plugs) do
  table.insert(ret, { plug, enabled = false })
end

plugs = ret

return plugs
