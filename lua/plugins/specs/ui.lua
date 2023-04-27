local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "rebelot/heirline.nvim",
    config = function()
      require("plugins.configs.ui.heirline")
    end,
    event = { "VeryLazy", "BufReadPost", "User Heirline" },
    init = lazyLoad("heirline.nvim"),
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "goolord/alpha-nvim",
    dependencies = {
      -- All optional, only required for the default setup.
      -- If you customize your config, these aren't necessary.
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
    },
    config = function()
      require("alpha").setup(require("ui.alpha").config)
    end,
    init = function()
      local file = vim.fn.expand "%"
      local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

      if not condition then
        require("lazy").load({ plugins = "alpha-nvim" })
      end
    end,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("ui.bufferline")
    end,
    init = lazyLoad("bufferline.nvim"),
    event = { "VeryLazy", "BufReadPost", "User Heirline" },
  },
  {
    "folke/noice.nvim",
    event = { "VeryLazy", "BufReadPost", "User Heirline" },
    init = lazyLoad("noice.nvim"),
    config = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      treesitter = true,
      use_treesitter = true,
    },
    config = true,
    event = { "VeryLazy" },
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "neogit" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
}
