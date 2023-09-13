return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "folke/flash.nvim",
    opts = {},
    keys = {
      {
        "s",
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        function()
          require("flash").treesitter()
        end,
        desc = "Flash tree-sitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      { "f", mode = { "n", "x", "o" } },
      { "F", mode = { "n", "x", "o" } },
      { "t", mode = { "n", "x", "o" } },
      { "T", mode = { "n", "x", "o" } },
    },
    event = {
      "CmdlineEnter",
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup({
        context_commentstring = {
          enable = true,
        },
      })

      require("Comment").setup(opts)
    end,
    keys = {
      { "gc", mode = { "x", "n" } },
      { "gb", mode = { "x", "n" } },
    },
    dependencies = {
      {
        "nvim-treesitter",
        dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
      },
    },
  },
}
