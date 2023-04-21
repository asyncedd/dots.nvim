local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "catppuccin/nvim",
    config = function()
      coroutine.resume(coroutine.create(function()
        require("ui.catppuccin")
      end))
    end,
  },
  {
    "echasnovski/mini.map",
    config = function()
      require("ui.map")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ui.blankline")
    end,
    init = lazyLoad("indent-blankline.nvim"),
  },
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("ui.indentscope")
    end,
    keys = {
      "viii",
      "vaii",
      "viai",
      "vaai",
    },
    init = lazyLoad("mini.indentscope"),
  },
  {
    "folke/noice.nvim",
    config = true,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "glepnir/dashboard-nvim",
    init = function()
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. "dashboard-nvim", {}),
        callback = function()
          local file = vim.fn.expand("%")
          local condition = file == ""

          if condition then
            vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. "dashboard-nvim")

            -- dont defer for treesitter as it will show slow highlighting
            -- This deferring only happens only when we do "nvim filename"
            require("lazy").load({ plugins = "dashboard-nvim" })
          end
        end,
      })
    end,
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "rebelot/heirline.nvim",
    config = function()
      coroutine.resume(coroutine.create(function()
        require("ui.heirline")
      end))
    end,
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "echasnovski/mini.animate",
    event = {
      "VeryLazy",
    },
    config = function()
      require("ui.animate")
    end,
  },
  {
    "edluffy/specs.nvim",
    config = function()
      require("ui.specs")
    end,
    event = {
      "VeryLazy",
    },
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("ui.illuminate")
    end,
    event = "VeryLazy",
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    init = lazyLoad("nvim-ts-rainbow2"),
    config = function()
      require("ui.rainbow")
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "akinsho/bufferline.nvim",
    event = "UIEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
    },
    config = function()
      require("ui.bufferline")
    end,
    keys = {
      { "<leader>fc", "<cmd>BufferLineTogglePin<cr>" },
      { "<leader>gd", "<cmd>BufferLinePick<cr>" },
      { "<leader>gD", "<cmd>BufferLinePickClose<cr>" },
      { "<leader>g" .. vim.v.count, "<Cmd>BufferLineGoToBuffer " .. vim.v.count .. "<CR>" },
      { "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>" },
      { "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>" },
      { "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>" },
      { "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>" },
      { "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>" },
      { "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>" },
      { "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>" },
      { "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>" },
      { "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>" },
      { "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>" },
      { "<leader>gn", "<cmd>BufferLineCycleNext<cr>" },
      { "<leader>gb", "<cmd>BufferLineCyclePrev<cr>" },
      { "<leader>gl", "<cmd>BufferLineCycleNext<cr>" },
      { "<leader>gh", "<cmd>BufferLineCyclePrev<cr>" },
    },
  },
}
