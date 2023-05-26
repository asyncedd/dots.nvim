-- lua/plugins/specs/coding.lua
--
--  ┌
--  │       Add better coding functionality into Neovim
--  └

return {
  {
    "L3MON4D3/LuaSnip",
    build = function()
      if not jit.os:find("Windows") then
        return "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
      else
        return nil
      end
    end,
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
      require("cmp").setup(opts.cmp)
      opts.cmd()
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
      "tailwindcss-colorizer-cmp.nvim",
      "codeium.nvim",
    },
  },
  {
    "altermo/ultimate-autopair.nvim",
    opts = function()
      return require("plugins.configs.coding.autopairs").ultimate
    end,
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "windwp/nvim-autopairs",
    opts = function()
      return require("plugins.configs.coding.autopairs").autopairs
    end,
    event = "InsertEnter",
  },
  {
    "kylechui/nvim-surround",
    opts = function()
      return require("plugins.configs.coding.surround")
    end,
    event = "VeryLazy",
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
    opts = {
      -- Add options here.
      -- If you're curious about the options check: https://github.com/tzachar/cmp-tabnine
      max_lines = 500,
      -- For example if you want to show the prediction strength (which isn't possible because of the cmp config) you can:
      -- show_prediction_strength = true
      -- NOTE: This doesn't work because of the current nvim-cmp config
    },
    config = function(_, opts)
      require("cmp_tabnine.config"):setup(opts)

      -- Tabnine allows prefetching results before the User asks for completions so, we'll be prefetching it for the current file.
      require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))

      -- And on BufRead (Which will not be executed on the initial load since the Autocmd is created on VeryLazy) we'll make it so, it'll prefetch too.
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("prefetch", { clear = true }),
        callback = function()
          require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))
        end,
      })
    end,
    build = function()
      if not jit.os:find("Windows") then
        return "./install.sh"
      else
        return "powershell ./install.ps1"
      end
    end,
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
    "mizlan/iswap.nvim",
    opts = true,
    keys = {
      { "<leader>is", "<cmd>ISwap<CR>", desc = "Interactively swap" },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = function()
      return require("plugins.configs.coding.mini-surround")
    end,
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
    keys = {
      "gzx",
      "gzX",
      "gzc",
    },
  },
  {
    "echasnovski/mini.move",
    opts = function()
      return require("plugins.configs.coding.move")
    end,
    config = function(_, opts)
      require("mini.move").setup(opts)
    end,
    keys = {
      { "<M-j>", mode = { "x", "n" } },
      { "<M-k>", mode = { "x", "n" } },
    },
  },
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<C-a>",
        function()
          return require("dial.map").inc_normal()
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_normal()
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "g<C-a>",
        function()
          return require("dial.map").inc_gnormal()
        end,
        expr = true,
        desc = "gIncrement",
      },
      {
        "g<C-x>",
        function()
          return require("dial.map").dec_gnormal()
        end,
        expr = true,
        desc = "gIncrement",
      },
      {
        "<C-a>",
        function()
          return require("dial.map").inc_visual()
        end,
        expr = true,
        desc = "Increment",
        mode = "x",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_visual()
        end,
        expr = true,
        desc = "Increment",
        mode = "x",
      },
      {
        "g<C-a>",
        function()
          return require("dial.map").inc_gvisual()
        end,
        expr = true,
        desc = "gIncrement",
        mode = "x",
      },
      {
        "g<C-x>",
        function()
          return require("dial.map").dec_gvisual()
        end,
        expr = true,
        desc = "gIncrement",
        mode = "x",
      },
    },
    config = function()
      require("plugins.configs.coding.dial").config()
    end,
  },
  {
    "mizlan/iswap.nvim",
    opts = true,
    keys = {
      { "gx", "<cmd>ISwap<CR>" },
    },
  },
  {
    "gbprod/yanky.nvim",
    opts = true,
    keys = {
      {
        "<leader>P",
        function()
          require("telescope").extensions.yank_history.yank_history({})
        end,
        desc = "Paste from Yanky",
      },
      {
        "y",
        "<Plug>(YankyYank)",
        mode = { "n", "x" },
      },
      {
        "p",
        "<Plug>(YankyPutAfter)",
        mode = { "x", "n" },
      },
      {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = { "x", "n" },
      },
      {
        "gp",
        "<Plug>(YankyGPutAfter)",
        mode = { "x", "n" },
      },
      {
        "gP",
        "<Plug>(YankyGPutBefore)",
        mode = { "x", "n" },
      },
      { "[y", "<Plug>(YankyCycleForward)" },
      { "]y", "<Plug>(YankyCycleBackward)" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)" },
      { "=p", "<Plug>(YankyPutAfterFilter)" },
      { "=P", "<Plug>(YankyPutBeforeFilter)" },
    },
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    opts = true,
  },
  {
    "jcdickinson/codeium.nvim",
    opts = true,
  },
}
