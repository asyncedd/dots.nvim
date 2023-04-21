return function()
  require("nvim-treesitter.configs").setup({

    -- Make sure we've installed:
    ensure_installed = { "markdown", "markdown_inline" },

    -- Auto-install mssing parsers
    auto_install = { enable = true },

    -- Enable highlighting.
    highlight = {
      enable = true,
      use_languagetree = true,
    },
  })
end
