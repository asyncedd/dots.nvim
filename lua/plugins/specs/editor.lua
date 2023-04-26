return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "markdown", "markdown_inline" },

        auto_install = true,

        highlight = {
          enable = true,
        },
      })
    end,
    event = { "BufRead", "BufNewFile", "BufEnter" },
  },
}
