-- Set the Markid's colors.
local markid_config = {
  bright = {
    "#f5c2e7",
    "#fab387",
    "#f9e2af",
    "#f5c0e8",
    "#94e2d5",
    "#89dceb",
    "#74c7ec",
    "#b4befe",
    "#cba6f7",
    "#c5e1a5",
  },
}

local setupTreesitter = function()
  -- Configure nvim-treesitter
  require("nvim-treesitter.configs").setup({

    -- Auto-install missing parsers. (once you open a file that requires it.)
    auto_install = true,

    -- Enable beautiful syntax highlighting!!!
    ensure_installed = { "markdown", "markdown_inline" },

    highlight = {
      enable = true,
      additional_regex_highlighting = true,
    },

    -- Enable nvim-treesitter indention.
    indent = {
      enable = true,
    },

    -- Configure Markid.
    markid = {
      enable = true,
      colors = markid_config.bright,
    },

    matchup = {
      enable = true,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        scope_incremental = "<CR>",
        node_incremental = "<TAB>",
        node_decremental = "<S-TAB>",
      },
    },

    -- Enable rainbow
    rainbow = {
      enable = true,
      query = "rainbow-parens",
      strategy = require("ts-rainbow.strategy.global"),
    },

    -- Be smarter!
    refactor = {
      highlight_definations = {
        enable = true,
        clear_on_cursor_move = true,
      },
      highlight_current_scope = {
        enable = true,
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
      navigation = {
        enable = true,
        keyamsp = {
          goto_defination = "gnd",
          list_defination = "gnD",
          list_defination_toc = "g0",
          goto_next_usage = "<a-*>",
          goto_previous_usage = "<a-#>",
        },
      },
    },
  })
end

return function()
  -- Checking if nvim-treesitter is installed properly.

  setupTreesitter()
end
