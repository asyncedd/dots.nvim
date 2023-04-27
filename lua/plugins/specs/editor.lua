return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("core.highlight.treesitter")

      require("nvim-treesitter.configs").setup({
        ensure_installed = { "markdown", "markdown_inline", "luap", "luadoc", "vim" },

        auto_install = true,

        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
        },
      })
    end,
    event = { "BufRead", "BufNewFile", "BufEnter" },
    init = require("core.utils.lazyLoad")("nvim-treesitter"),
  },
  {
    "lewis6991/gitsigns.nvim",
    -- event = { "BufRead", "BufNewFile" },
    event = "User UI",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
    config = true,
  }
}
