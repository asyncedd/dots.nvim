return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = { "lua", "vim", "luap", "markdown", "markdown_inline" },

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        -- Enable highlighting
        highlight = {
          enable = true,
        },
      })
    end,
    build = ":TSUpdate",
    event = { "BufReadPost" }
  },
}
