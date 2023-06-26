-- lua/plugins/specs/coding.lua
--
--  ┌
--  │       Add better coding functionality into Neovim
--  └

local does_ft_exist = function()
  local ft = vim.bo.filetype
  local exists = require("plugins.configs.coding.dial").ft[ft] and ft or nil
  return exists
end

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
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
      require("luasnip.loaders.from_lua").lazy_load({ paths = { "./luasnip" } })
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("plugins.configs.coding.cmp")
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      -- Auto pairs
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
      cmp.setup(opts.cmp)
      opts.cmd()
    end,
    event = { "InsertEnter", "VeryLazy", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
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
    opts = {
      keymaps = {
        -- https://github.com/ggandor/leap.nvim/discussions/59#discussioncomment-3842315
        insert = "<C-g>z",
        insert_line = "<C-g>Z",
        normal = "gz",
        normal_cur = "gZ",
        normal_line = "gzz",
        normal_cur_line = "gZZ",
        visual = "gz",
        visual_line = "gZ",
        delete = "gzd",
        change = "gzr",
      },
    },
    keys = {
      { "<C-g>z", mode = "i" },
      { "<C-g>Z", mode = "i" },
      { "gz", mode = { "n", "x" } },
      { "gZ", mode = { "n", "x" } },
      { "gzz", mode = { "n", "x" } },
      { "gZZ", mode = { "n", "x" } },
      "gzd",
      "gzr",
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = function()
      return {
        treesitter = {
          comment_string = {
            enable = true,
            enable_autocmd = false,
          },
        },
        Comment = {
          pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        },
        Mini = {
          options = {
            custom_commentstring = function()
              return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
            end,
          },
          hooks = {
            pre = function()
              require("ts_context_commentstring.internal").update_commentstring()
            end,
          },
          mappings = {
            comment = "",
            comment_line = "",
            textobject = "gc",
          },
        },
      }
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
    "echasnovski/mini.bracketed",
    opts = function()
      return require("plugins.configs.coding.bracketed")
    end,
    event = "VeryLazy",
  },
  {
    "Wansmer/treesj",
    opts = {
      use_default_keymaps = false,
      max_join_length = 500,
    },
    keys = {
      { "gS", "<cmd>lua require('treesj').toggle()<CR>", mode = { "n", "x" }, desc = "Toggle split/join" },
    },
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
    "echasnovski/mini.move",
    opts = function()
      return require("plugins.configs.coding.move")
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
          return require("dial.map").inc_normal(does_ft_exist())
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_normal(does_ft_exist())
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "g<C-a>",
        function()
          return require("dial.map").inc_gnormal(does_ft_exist())
        end,
        expr = true,
        desc = "gIncrement",
      },
      {
        "g<C-x>",
        function()
          return require("dial.map").dec_gnormal(does_ft_exist())
        end,
        expr = true,
        desc = "gIncrement",
      },
      {
        "<C-a>",
        function()
          return require("dial.map").inc_visual(does_ft_exist())
        end,
        expr = true,
        desc = "Increment",
        mode = "x",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_visual(does_ft_exist())
        end,
        expr = true,
        desc = "Increment",
        mode = "x",
      },
      {
        "g<C-a>",
        function()
          return require("dial.map").inc_gvisual(does_ft_exist())
        end,
        expr = true,
        desc = "gIncrement",
        mode = "x",
      },
      {
        "g<C-x>",
        function()
          return require("dial.map").dec_gvisual(does_ft_exist())
        end,
        expr = true,
        desc = "gIncrement",
        mode = "x",
      },
    },
    config = function()
      require("plugins.configs.coding.dial").config(does_ft_exist())
    end,
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
    "windwp/nvim-ts-autotag",
    opts = {
      enable = true,
    },
    config = function(_, opts)
      require("plugins.configs.coding.autotag")(opts)
    end,
    event = "InsertEnter",
  },
  {
    "gbprod/substitute.nvim",
    opts = true,
    keys = {
      {
        "gx",
        function()
          require("substitute").operate()
        end,
      },
      {
        "gxx",
        function()
          require("substitute").line()
        end,
      },
      {
        "gX",
        function()
          require("substitute").eol()
        end,
      },
      {
        "gx",
        function()
          require("substitute").visual()
        end,
        mode = "x",
      },
    },
  },
  {
    "jcdickinson/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {},
    event = "VeryLazy",
  },
}
