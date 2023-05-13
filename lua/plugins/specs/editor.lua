return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require("plugins.configs.editor.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    init = function()
      require("core.utils.lazy_load")("nvim-treesitter")
    end,
    build = ":TSUpdate",
  },
  {
    "kevinhwang91/nvim-ufo",
    opts = function()
      return require("plugins.configs.editor.ufo")
    end,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = true,
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require("plugins.configs.editor.gitsigns")
    end,
    config = true,
    init = function()
      require("core.utils.lazy_load")("gitsigns.nvim")
    end,
  },
  {
    "folke/which-key.nvim",
    opts = function()
      return require("plugins.configs.editor.which-key")
    end,
    event = "VeryLazy",
  },
  {
    "olimorris/persisted.nvim",
    opts = function()
      return require("plugins.configs.editor.persisted")
    end,
    config = function(_, opts)
      require("persisted").setup(opts)

      require("telescope").load_extension("persisted")
    end,
    cmd = {
      "SessionLoad",
      -- Load all other Session commands when, "Session" is typed.
      -- Thus, providing autocompletion for other commands.
      "Session",
    },
    event = { "VeryLazy" },
  },
}
