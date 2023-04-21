-- Set the Markid's colors.

local setupTreesitter = function()
  -- Configure nvim-treesitter
  require("nvim-treesitter.configs").setup({

    -- Auto-install missing parsers. (once you open a file that requires it.)
    auto_install = true,

    -- Enable beautiful syntax highlighting!!!
    -- ensure_installed = { "markdown", "markdown_inline" },

    highlight = {
      enable = true,
      additional_regex_highlighting = true,
      use_languagetree = true,
    },

    -- Enable nvim-treesitter indention.
    indent = {
      enable = true,
    },
  })
end

return function()
  -- Checking if nvim-treesitter is installed properly.

  setupTreesitter()
end
