-- WARNING: DO NOT REMOVE THE `local M = {}` OR THERE'LL BE SPOOKY ERRORS!
-- START
local M = {}
-- END

-- The colorscheme to use. It can be: [catppuccin, tokyonight, nightfox or onedarkpro]
--
-- TIP: Installed some other colorscheme? Will, just add it!
-- for eg. You can use the vim.cmd.colorscheme (:colorscheme) <name>
-- and just put the name below and it'll be used!
M.colorscheme = {
  current = "catppuccin",
  disable_non_current = false,
  load_on_VeryLazy = false,
}

-- Language integration to use.
-- The filetypes below are the only supported ones for now.
-- For example to disable Lua integration change the `lua = true,` to `lua = false,`
-- FUN FACT: The language servers will still start so, make sure to go `:Mason` and uninstall them!
M.languages = {
  lua = {
    luapad = false,
    evalua = false,
  },
  typescript = true,
  svelte = true,
  fish = true,
  rust = true,
  markdown = {
    headlines = true,
  },
  shell = false,
  python = true,
  web = {
    -- olrtg, aca
    emmet = "olrtg",
  },
  c = true,
  astro = false,
  go = false,
  yuck = false,
}

-- A list of plugins to disable.
-- You simply add plugins to disable, that's it!
-- (You might break things so beware)
M.disabled_plugins = {
  "max397574/better-escape.nvim",
  "ziontee113/deliberate.nvim",
}

M.lsp = {
  diagnostics = {
    -- Helix like diagnostics.
    helix = false,
    -- Use lsp_lines.nvim for the diagnostics
    lines = {
      enabled = false,
    },
    -- Pretty list for diagnostics
    trouble = {
      enabled = false,
      -- Disable trouble.nvim for Gitsigns hunks
      properly_lazyload = false,
    },
  },
  -- Whetever or not to enable lspsaga
  saga = true,
}

M.coding = {
  codeium = {
    -- Whetever or not to enable codeium
    enabled = true,
    -- Use http.nvim or not.
    -- It might reduce latency but it'll take some time to compile
    http = false,
  },
}

M.UI = {
  -- Have rainbow delimiters
  rainbow_delimiters = false,
  statusline = {
    -- heirline, mini, lualine
    type = "heirline",
  },
}

M.buffer = {
  akinsho = {
    enabled = true,
    dont_show_if_only_one = true,
  },
  tomiis4 = {
    enabled = false,
    vertical = "top",
    horizontal = "center",
    display = "row",
    border = "solid",
  },
  mini = {
    enabled = false,
  },
  cybu = {
    enabled = true,
  },
}

M.notes = {
  neorg = true,
  obsidian = {
    enabled = true,
    -- Your obsidian path
    path = vim.fn.expand("~") .. "/obsidian",
  },
  vimwiki = false,
  orgmode = false,
}

M.goodies = {
  image = {
    enabled = true,
    -- kitty, ueberzug
    backend = "kitty",
  },
  hover = {
    -- lewis6991, pretty
    type = "pretty",
  },
  fun = {
    cellular_automation = true,
  },
  tree = {
    neotree = true,
    nvim_tree = false,
    chadtree = false,
  },
  -- Image snippets
  snippets = {
    rayso = false,
    carbonnow = false,
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
