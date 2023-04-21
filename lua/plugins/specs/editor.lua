local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("editor.treesitter")
    end,
    init = lazyLoad("nvim-treesitter"),
    build = ":TSUpdate",
  },
  {
    "andymass/vim-matchup",
    init = lazyLoad("vim-matchup"),
    config = function()
      require("editor.matchup")
    end,
  },
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup()
    end,
    keys = {
      { "vi", mode = { "x", "o", "n", "v" } },
      { "va", mode = { "x", "o", "n", "v" } },
    },
  },
  {
    "echasnovski/mini.bracketed",
    config = function()
      require("mini.bracketed").setup()
    end,
    keys = {
      { "[", mode = { "x", "o", "n", "v" } },
      { "]", mode = { "x", "o", "n", "v" } },
    },
  },
  {
    "folke/todo-comments.nvim",
    init = lazyLoad("todo-comments.nvim"),
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
      },
      "za",
    },
    config = function()
      require("editor.ufo")
    end,
  },
  {
    "chrisgrieser/nvim-recorder",
    config = true,
    keys = {
      "q",
      "Q",
      "<C-q>",
      "cq",
      "yq",
      "##",
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    ft = {
      "md",
      "markdown",
    },
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = true,
    init = lazyLoad("nvim-treesitter-context"),
    -- event = "UIEnter",
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("editor.textobjs")
    end,
    keys = {
      "vii",
      "vai",
      "vaI",
      "viI",
      "vR",
      "v%",
      "viS",
      "vaS",
      "vr",
      "vgG",
      "vn",
      "v_",
      "v|",
      "viv",
      "vav",
      "vik",
      "vak",
      "vL",
      "vin",
      "van",
      "v!",
      "viz",
      "vaz",
      "vim",
      "vam",
      "vil",
      "val",
      "viC",
      "vaC",
      "vic",
      "vac",
      "vix",
      "vax",
      "vi/",
      "va/",
      "viD",
      "vaD",
      "viP",
      "vaP",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("editor.ts-textobj")
    end,
    keys = {
      "vaf",
      "vif",
      "vac",
      "vic",
      "vas",
      "<leader>a",
      "<leader>A",
      "]m",
      "]]",
      "]o",
      "]s",
      "]z",
      "]M",
      "][",
      "[m",
      "[[",
      "[M",
      "[]",
      "]d",
      "[d",
      "<leader>df",
      "<leader>dF",
      {
        ";",
        function()
          require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_next()
        end,
        mode = { "n", "x", "o" },
      },
      {
        ",",
        function()
          require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_previous()
        end,
        mode = { "n", "x", "o" },
      },
    },
  },
  {
    "folke/which-key.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    config = true,
    keys = {
      { "ys", mode = { "x", "n", "v" } },
      { "ds", mode = { "x", "n", "v" } },
      { "cs", mode = { "x", "n", "v" } },
    },
  },
}
