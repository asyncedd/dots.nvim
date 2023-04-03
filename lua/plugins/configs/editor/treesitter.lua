return function ()
  -- Checking if nvim-treesitter is installed properly.
  local treesitter = require("nvim-treesitter.configs")

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

  -- Configure nvim-treesitter
  treesitter.setup({

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
        init_selection = '<CR>',
        scope_incremental = '<CR>',
        node_incremental = '<TAB>',
        node_decremental = '<S-TAB>',
      },
    },
  })
end
