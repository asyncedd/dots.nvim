local icons = require("core.utils.icons.lazy")

require("lazy").setup({
  { import = "plugins.specs" },
}, {
    {
      performance = {
        rtp = {
          -- We're going to disable some runtime plugins that we don't need.
          disabled_plugins = {
            "2html_plugin",
            -- "getscript",
            -- "getscriptPlugin",
            "gzip",
            -- "logipat",
            "netrw",
            -- "netrwFileHandlers",
            -- "loaded_remote_plugins",
            -- "loaded_tutor_mode_plugin",
            "netrwPlugin",
            "netrwSettings",
            -- "rrhelper",
            "spellfile_plugin",
            "tar",
            "tarPlugin",
            "vimball",
            "vimballPlugin",
            "zip",
            "zipPlugin",
            "rplugin",
            "tohtml",
            "tutor",
            -- "shada",
            "spellfile",
            "matchit",
            "matchparen",
            "man",
            "nvim",
            "editorconfig",
          },
        },
      },
      ui = {
        -- size = { width = 0.8, height = 0.8 },
        -- We're gonna make the GUI (actually, it's a TUI) curved!
        -- Look at those curves! (WTF. Add +1 to the WTF/Min)
        border = "rounded",
        -- I dunno, lazy.nvim doesn't really seem to find this so here, uwu!
        icons = {
          lazy = icons.lazy,
        },
        -- throttle = 50,
      },
      install = {
        -- When we're installing plugins it'll default to the habamax colorscheme but, we like our catppuccino mocha catppuccin so we're going to default to that.
        -- And also Tokyonight.nvim, even though we don't have it installed (+1 WTF/min)
        colorscheme = { "catppuccin", "tokyonight", "habamx" },
      },
      -- Oh yeah, we're going to lazy-laod every plugin by default.
      -- because I'm too lazy to add that 12 characters!
      -- (+1 WTF/Min)
      defaults = {
        lazy = true,
      },
    }
  })
