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
  astro = false,
  go = false,
  yuck = false,
}

-- A list of plugins to disable.
-- You simply add plugins to disable, that's it!
-- (You might break things so beware)
M.disabled_plugins = {
  "nvim-neo-tree/neo-tree.nvim",
  "max397574/better-escape.nvim",
  "ziontee113/deliberate.nvim",
}

M.lsp = {
  diagnostics = {
    -- Helix like diagnostics.
    helix = false,
    -- Use lsp_lines.nvim for the diagnostics
    lines = {
      enabled = true,
    },
  },
}

-- WARNING: DO NOT MODIFY STUFF UNDER THIS!
-- It'll lead to unexpected behavior!

-- Register the confiugration above as a global variable.
_G.dots = M

local ret = {}

for _, plug in ipairs(M.disabled_plugins) do
  table.insert(ret, { plug, enabled = false })
end

return ret
