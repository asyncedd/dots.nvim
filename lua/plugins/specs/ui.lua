local lazyLoad = require("core.utils.lazyLoad")

return {
  "catppuccin/nvim",
  -- {
  --   "echasnovski/mini.map",
  --   config = function()
  --     require("ui.map")
  --   end,
  -- },
  -- {
  --   "wfxr/minimap.vim",
  --   -- config = true,
  --   build = "cargo install --locked code-minimap",
  --   -- event = "VeryLazy",
  --   lazy = false,
  --   dependencies = "wfxr/code-minimap",
  -- },
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
    config = function()
      require("ui.dashboard")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "rebelot/heirline.nvim",
    config = function()
      require("ui.heirline")
    end,
    init = lazyLoad("heirline.nvim"),
    -- event = "UIEnter",
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
    -- event = "UIEnter",
    init = lazyLoad("bufferline.nvim"),
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
    },
    config = function()
      require("ui.bufferline")
    end,
    keys = {
      { "<leader>fc", "<cmd>BufferLineTogglePin<cr>" },
      { "<leader>gbp", "<cmd>BufferLinePick<cr>" },
      { "<leader>gb", "<cmd>BufferLinePickClose<cr>" },
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
      { "<tab>", "<cmd>BufferLineCycleNext<cr>" },
      { "<S-tab>", "<cmd>BufferLineCyclePrev<cr>" },
      { "[b", "<cmd>BufferLineMoveNext<cr>" },
      { "]b", "<cmd>BufferLineMovePrev<cr>" },
    },
  },
  {
    "declancm/cinnamon.nvim",
    config = function()
      require("ui.cinnamon")
    end,
    keys = {
      { "<C-u>", '<cmd>lua Scroll("<C-u>")<cr>', mode = "" },
      { "<C-u>", '<cmd>lua Scroll("<C-u>")<cr>', mode = "i" },
      { "<C-d>", '<cmd>lua Scroll("<C-d>")<cr>', mode = "" },
      { "<C-d>", '<cmd>lua Scroll("<C-d>")<cr>', mode = "i" },
      { "<C-b>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>", mode = "n" },
      { "C-f>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>", mode = "n" },
      { "<PageUp>", "<cmd>lua Scroll('<C-b>', 1, 1)<cr>", mode = "n" },
      { "<PageDown>", "<cmd>lua Scroll('<C-f>', 1, 1)<cr>", mode = "n" },
      { "gg", "<Cmd>lua Scroll('gg', 0, 0, 3)<cr>", mode = { "n", "x" } },
      { "G", "<cmd>lua Scroll('G', 0, 1, 3)<cr>", mode = { "n", "x" } },
      { "M", "<cmd>lua Scroll('M', 0, 1, 3)<cr>", mode = { "n", "x" } },
      { "{", "<cmd>lua Scroll('{', 0)<cr>", mode = { "n", "x" } },
      { "}", "<cmd>lua Scroll('}', 0)<cr>", mode = { "n", "x" } },
      { "n", "<cmd>lua Scroll('n')<cr>" },
      { "N", "<cmd>lua Scroll('N')<cr>" },
      { "*", "<cmd>lua Scroll('*')<cr>" },
      { "#", "<cmd>lua Scroll('#')<cr>" },
      { "g*", "<cmd>lua Scroll('g*')<cr>" },
      { "g#", "<cmd>lua Scroll('g#')<cr>" },
      { "<C-o>", "<cmd>lua Scroll('<C-o>')<cr>" },
      { "<C-i>", "<cmd>lua Scroll('<C-i>')<cr>" },
      { "zz", "<cmd>lua Scroll('zz', 0, 1)<cr>" },
      { "zt", "<cmd>lua Scroll('zt', 0, 1)<cr>" },
      { "zb", "<cmd>lua Scroll('zb', 0, 1)<cr>" },
      { "z.", "<cmd>lua Scroll('z.', 0, 1)<cr>" },
      { "z<cr>", "<cmd>lua Scroll('z<cr>', 0, 1)<cr>" },
      { "z-", "<cmd>lua Scroll('z-', 0, 1)<cr>" },
      { "z+", "<cmd>lua Scroll('z+', 0, 1)<cr>" },
      { "z^", "<cmd>lua Scroll('z^', 0, 1)<cr>" },
      { "k", "<cmd>lua Scroll('k', 0, 1, 3)<cr>", mode = { "n", "x" } },
      { "j", "<cmd>lua Scroll('j', 0, 1, 3)<cr>", mode = { "n", "x" } },
      { "<Up>", "<cmd>lua Scroll('k', 0, 1, 3)<cr>", mode = { "n", "x" } },
      { "<Down>", "<cmd>lua Scroll('j', 0, 1, 3)<cr>", mode = { "n", "x" } },
    },
  },
  {
    "gen740/SmoothCursor.nvim",
    config = true,
    event = "VeryLazy",
  },
  -- {
  --   "tamton-aquib/flirt.nvim",
  --   config = true,
  --   event = {
  --     "WinNew",
  --     "VeryLazy",
  --   },
  -- },
  {
    "freddiehaddad/feline.nvim",
    config = function()
      require("ui.feline")
    end,
  },
  -- {
  --   "folke/drop.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("ui.drop")
  --   end,
  -- },
}
