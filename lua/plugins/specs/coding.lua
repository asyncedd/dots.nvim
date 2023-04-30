return {
  {
    "L3MON4D3/LuaSnip",
    opts = function()
      return require("plugins.configs.coding.luasnip")
    end,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    config = function(_, opts)
      require("luasnip").setup(opts)

      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
      require("luasnip.loaders.from_lua").lazy_load({ paths = { "./luasnip" } })
    end,
    event = { "VeryLazy", "InsertEnter" },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("plugins.configs.coding.cmp")
    end,
    config = true,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
    },
  },
  {
    "altermo/npairs-integrate-upair",
    opts = function()
      return require("plugins.configs.coding.autopairs")
    end,
    config = function(_, opts)
      require("npairs-int-upair").setup(opts)

      local event = require('cmp').event
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
    end,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "windwp/nvim-autopairs",
      "altermo/ultimate-autopair.nvim",
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "kylechui/nvim-surround",
    config = true,
    event = "VeryLazy",
  },
  {
    "abecodes/tabout.nvim",
    config = true,
    event = { "InsertEnter" },
  },
  {
    "numToStr/Comment.nvim",
    opts = function()
      return require("plugins.configs.coding.comment")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts.treesitter)

      require("Comment").setup(opts.comment)
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "g", mode = { "n", "x" } },
    },
  },
  {
    "Wansmer/treesj",
    config = true,
    keys = {
      "<leader>m",
      "<leader>j",
      "<leader>s",
    },
  },
  {
    "gbprod/yanky.nvim",
    config = function(_, opts)
      require("yanky").setup(opts)

      require("telescope").load_extension("yank_history")
    end,
    keys = {
      { "p", "<Plug>(YankyPutAfter)>", mode = { "n", "x" }, desc = "Put after from your clipboard" },
      { "gp", "<Plug>(YankyGPutAfter)>", mode = { "n", "x" }, desc = "GPut after from your clipboard" },
      { "P", "<Plug>(YankyPutBefore)>", mode = { "n", "x" }, desc = "Put before from your clipboard" },
      { "gP", "<Plug>(YankyGPutBefore)>", mode = { "n", "x" }, desc = "GPut before from your clipboard" },
      { "<C-n>", "<Plug>(YankyCycleFoward)", desc = "Go foward the yanky-ring" },
      { "<C-p>", "<Plug>(YankyCyclePrevious)", desc = "Go backwards the yanky-ring" },
      { "<leader>fy", "<cmd>Telescope yank_history theme=dropdown<CR>", desc = "Find yanks" },
    },
    event = "VeryLazy",
  },
}
