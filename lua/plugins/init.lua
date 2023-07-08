local dis_plugs = require("settings.settings")

-- NOTE: vim.fn.stdpath("data") is in Linux systems: ~/.local/nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If it's not found - indicating that it's not found - Git clone it.
if not vim.uv.fs_stat(lazypath) then
  -- Show a lovely message indicating that we're boostrapping lazy :)
  print(" Bootstrapping lazy.nvim!")

  -- NOTE: lazy.nvim recommends to use vim.fn.system but, via `vim.cmd("!...")` we can know the progress 🤯
  vim.cmd("!git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable " .. lazypath)

  -- TODO: Try to make this actually show up. (it's destroyed by cmdheight atm)
  print(" Done!")
end

-- Add it to RTP. So, we can require it later on.
vim.opt.rtp:prepend(lazypath)

-- NOTE: import plugins from `lua/plugins/specs`
require("lazy").setup({ { import = "plugins.specs" }, { import = "plugins.specs.languages" }, dis_plugs }, {
  defaults = {
    -- PERF: Lazy-load by default.
    lazy = true,
    -- NOTE: Use the latest version of the plugin. (screw semantic versioning)
    version = false,
  },
  install = {
    -- NOTE: Install missing plugins.
    missing = true,
    colorscheme = {
      -- NOTE: These are a list of plugins to load when installing a plugin.
      -- NOTE: It's listed on order. catppuccin -> habamax.
      "catppuccin",
      "habamax",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        -- PERF: Disable some RTP plugins to improve performance.
        -- NOTE: I can disable more plugins such as `rplugin` and `netrw`, but it'll decrease functionality.
        --
        -- as for netrw, I've replaced that with mini.files
        -- Which is generally more powerful
        -- And, for both matchit/paren, I've replaced that with vim-matchup
        -- For, editorconfig, ATM I don't use it so, I don't really need it.
        --
        -- I have no idea about rplugin.
        -- TODO: Find an alterative or re-enable rplugin
        "gzip",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "rplugin",
        "tutor",
        "spellfile",
        "editorconfig",
      },
    },
  },
})
