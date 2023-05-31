-- lua/plugins/specs/ui.lua
--
--  ┌
--  │               Plugins that improve the UI
--  └

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = function()
      return require("plugins.configs.ui.catppuccin")
    end,
    config = true,
  },
  {
    "rebelot/kanagawa.nvim",
    opts = function()
      return require("plugins.configs.ui.kanagawa")
    end,
    config = true,
    build = ":kanagawaCompile",
  },
  {
    "folke/tokyonight.nvim",
    opts = function()
      return require("plugins.configs.ui.tokyonight")
    end,
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    opts = function()
      return require("plugins.configs.ui.bufferline")
    end,
    config = true,
    dependencies = {
      "nvim-web-devicons",
      {
        "echasnovski/mini.bufremove",
        config = function()
          require("mini.bufremove").setup()
        end,
      },
      { "tiagovla/scope.nvim", opts = true },
    },
    event = "VeryLazy",
    keys = {
      { "gbb", "<cmd>BufferLinePick<CR>", desc = "Toggle Buffer picker" },
      { "gbp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Buffer pin" },
      { "gbd", "<cmd>lua require('mini.bufremove').delete(0, false)<CR>", desc = "Delete current buffer" },
      { "gbc", "<cmd>BufferLinePickClose<CR>", desc = "Toggle buffer picker closer" },
      { "[b", "<cmd>BufferLineCycleNext<CR>", desc = "Cycle to the next buffer" },
      { "]b", "<cmd>BufferLineCyclePrev<CR>", desc = "Cycle to the prev buffer" },
    },
  },
  {
    "folke/noice.nvim",
    opts = function()
      return require("plugins.configs.ui.noice")
    end,
    event = "VeryLazy",
    config = true,
    dependencies = {
      "nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "notify" },
    },
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.indentscope",
    opts = function()
      return require("plugins.configs.ui.indentscope")
    end,
    event = "VeryLazy",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "notify" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
  {
    "echasnovski/mini.animate",
    opts = function()
      return require("plugins.configs.ui.animate")
    end,
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "rebelot/heirline.nvim",
    opts = function()
      return require("plugins.configs.ui.heirline")
    end,
    config = true,
    event = "User UI",
    dependencies = {
      {
        "jcdickinson/wpm.nvim",
        config = true,
      },
      "nvim-web-devicons",
    },
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure()
    end,
    event = "VeryLazy",
  },
  {
    "goolord/alpha-nvim",
    opts = function()
      return require("plugins.configs.ui.alpha")
    end,
    config = function(_, opts)
      require("alpha").setup(opts)
    end,
    init = function()
      if vim.fn.expand("%") == "" then
        require("lazy").load({ plugins = "alpha-nvim" })
      end
    end,
  },
  {
    "folke/drop.nvim",
    opts = function()
      return require("plugins.configs.ui.drop")
    end,
    config = true,
    event = { "CursorHold", "CursorHoldI", "VeryLazy" },
  },
  {
    -- TODO: Add Todo-comments.nvim
    "folke/todo-comments.nvim",
    opts = true,
    event = "VeryLazy",
  },
  {
    "edluffy/specs.nvim",
    opts = function()
      return require("plugins.configs.ui.specs")
    end,
    event = "VeryLazy",
  },
  {
    "mvllow/modes.nvim",
    opts = function()
      return require("plugins.configs.ui.modes")
    end,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.hipatterns",
    opts = function()
      return require("plugins.configs.ui.hipatterns")
    end,
    config = function(_, opts)
      require("mini.hipatterns").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        tailwind = false,
        names = false,
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)

      require("colorizer").attach_to_buffer(0)
    end,
    init = function()
      require("core.utils.lazy")("nvim-colorizer.lua")
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    opts = true,
    init = function()
      require("core.utils.lazy")("dropbar.nvim")
    end,
  },
}
