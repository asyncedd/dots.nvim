return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function()
      return require("plugins.configs.coding.luasnip")
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "honza/vim-snippets",
    },
    event = "VeryLazy",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("plugins.configs.coding.cmp")
    end,
    config = function(_, opts)
      require("cmp").setup(opts)

      require("plugins.configs.coding.cmp-cmd")
    end,
    event = { "InsertEnter", "VeryLazy", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-cmdline",
      "cmp-tabnine",
      "hrsh7th/cmp-emoji",
      -- "codeium.nvim",
      "lukas-reineke/cmp-rg",
    },
  },
  {
    "altermo/ultimate-autopair.nvim",
    opts = function()
      return require("plugins.configs.coding.autopairs")
    end,
    config = function(opts)
      require("ultimate-autopair").setup(opts.upair)

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
    dependencies = {
      "windwp/nvim-autopairs",
    },
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "kylechui/nvim-surround",
    config = true,
    event = "VeryLazy",
    keys = {
      { "S", mode = "x" },
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = function()
      return require("plugins.configs.coding.comment")
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "echasnovski/mini.comment",
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts.treesitter)

      require("Comment").setup(opts.Comment)

      require("mini.comment").setup(opts.Mini)
    end,
    event = "VeryLazy",
  },
  {
    "andymass/vim-matchup",
    opts = function()
      return require("plugins.configs.coding.matchup")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.cmd("silent! do FileType")
    end,
    dependencies = {
      "nvim-treesitter",
    },
    init = function()
      require("core.utils.lazy_load")("vim-matchup")
    end,
  },
  {
    "echasnovski/mini.bracketed",
    opts = function()
      return require("plugins.configs.coding.bracketed")
    end,
    config = function(_, opts)
      require("mini.bracketed").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "Wansmer/treesj",
    opts = {
      use_default_keymaps = false,
      max_join_length = 500,
    },
    event = "VeryLazy",
    keys = {
      { "gS", "<cmd>lua require('treesj').toggle()<CR>", mode = { "n", "x" }, desc = "Toggle split/join" },
    },
  },
  {
    "tzachar/cmp-tabnine",
    opts = function()
      return require("plugins.configs.coding.tabnine")
    end,
    config = function(_, opts)
      require("cmp_tabnine.config"):setup(opts)
      require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))

      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("prefetch", { clear = true }),
        callback = function()
          require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))
        end,
      })
    end,
    build = "./install.sh",
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    cmd = "Spectre",
    keys = {
      { "<localleader>s", "<cmd>Spectre<CR>", desc = "Open spectre" },
    },
  },
  {
    "ecthelionvi/NeoComposer.nvim",
    opts = true,
    keys = {
      "q",
      "Q",
      "yq",
      "cq",
      "<C-n>",
      "<C-p>",
      "<M-p>",
    },
    dependencies = {
      "sqlite.lua",
    },
  },
  -- {
  --   "jcdickinson/codeium.nvim",
  --   opts = true,
  --   dependencies = {
  --     "http.nvim",
  --     "plenary.nvim",
  --     "nvim-cmp",
  --   },
  --   commit = "2f28f61",
  -- },
  -- {
  --   "jcdickinson/http.nvim",
  --   build = "cargo build --workspace --release",
  -- },
  {
    "simrat39/rust-tools.nvim",
    opts = function()
      return require("plugins.configs.coding.rust-tools")
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    opts = true,
    keys = {
      {
        "<leader>rr",
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        mode = "x",
        noremap = true,
      },
    },
    dependencies = {
      "plenary.nvim",
    },
  },
}
