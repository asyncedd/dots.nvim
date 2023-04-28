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
  },
  {
    "andymass/vim-matchup",
    config = function()
      require("nvim-treesitter.configs").setup({
        matchup = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })

      vim.cmd("silent! do FileType")
      local g = vim.g

      -- Don't show offscreen matches.
      g.matchup_matchparen_offscreen = { method = "none" }
      -- Enable transmute.
      -- Read: https://github.com/andymass/vim-matchup/blob/5a1978e46a0e721b5c5d113379c685ff7ec339e7/doc/matchup.txt#L31
      g.matchup_transmute_enabled = 1
      -- Defer surround matching. (To improve performance)
      g.matchup_matchparen_deferred = 1
    end,
    -- event = "User LSP",
    event = "VeryLazy",
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("editor.wk")
    end,
    event = { "VeryLazy" },
  },
}
