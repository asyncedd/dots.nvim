-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("NOTICE: Bootstrapping Lazy.nvim. Please wait! (It shouldn't be too long!)")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
  print("OK: Done!")
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local disabledPlugins = require("user.builtinPlugins")
local lazyLoad = function(plugin) -- Stole this from NvChad, hehe.
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand "%"
      local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

        -- dont defer for treesitter as it will show slow highlighting
        -- This deferring only happens only when we do "nvim filename"
        if plugin ~= "nvim-treesitter" then
          vim.schedule(function()
            require("lazy").load({ plugins = plugin })

            if plugin == "nvim-lspconfig" or plugin == "null-ls" then
              vim.cmd("silent! do FileType")
            end
          end)
        else
          require("lazy").load({ plugins = plugin })
        end
      end
    end,
  })
end

local plugins = {
  {
    {
      "catppuccin/nvim",
      config = function()
        require("ui.catppuccin")
      end,
    },
    "FrenzyExists/aquarium-vim",
    {
      "wuelnerdotexe/vim-enfocado",
      config = function ()
        vim.g.enfocado_style = "nature" -- You can go for "neon" too.
      end,
    },
    {
      "folke/tokyonight.nvim",
      config = function()
        require("ui.tokyonight")
      end,
    },
    {
      "rebelot/kanagawa.nvim",
      config = function()
        require("ui.kanagawa")
      end
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    init = lazyLoad("nvim-treesitter"),
    config = function()
      vim.loader.find("editor.treesitter")
    end,
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  },
  -- {
  --   "andymass/vim-matchup",
  --   config = function()
  --    require("editor.matchup")
  --   end,
  --   init = lazyLoad("vim-matchup"),
  -- },
  {
    "neovim/nvim-lspconfig",
    init = lazyLoad("nvim-lspconfig"),
    config = function()
      require("lsp.config")
    end,
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function()
          require("lsp.mason")
        end,
        init = lazyLoad("mason.nvim"),
        build = ":Mason",
        -- event = "BufReadPre",
      },
      "folke/neodev.nvim",
      "ray-x/lsp_signature.nvim",
      {
        "glepnir/lspsaga.nvim",
        config = function()
          require("lsp.saga")
        end,
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          { "nvim-treesitter/nvim-treesitter" },
        },
      }
    }
  },
  {
    "j-hui/fidget.nvim",
    config = true,
    init = lazyLoad("fidget.nvim"),
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function ()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
          "onsails/lspkind.nvim"
        },
      },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      require("completion.cmp")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = true,
    init = lazyLoad("indent-blankline.nvim"),
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("editor.gitsigns")
    end,
    init = lazyLoad("gitsigns.nvim"),
  },
  {
    "rebelot/heirline.nvim",
    init = lazyLoad("heirline.nvim"),
    config = function()
      require("ui.heirline")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("editor.leap")
    end,
  },
  {
    "LeonHeidelbach/trailblazer.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("tools.telescope")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    event = "VeryLazy"
  },
  {
    "thePrimeagen/harpoon",
    config = function()
      require("tools.harpoon")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.nvim",
    config = function()
      require("plugins.configs.mini")
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    init = lazyLoad("mini.nvim"),
    event = "InsertEnter",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("tools.nvimtree")
    end,
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFocus",
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      { "<leader>tr", "<cmd>NvimTreeToggle<cr>" },
    },
  },
  {
    "glepnir/dashboard-nvim",
    config = true,
    init = function()
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function ()
          if("" == filename) then
            require("lazy").load({ plugins =  { "dashboard-nvim" } })
          else
            return
          end
        end,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    config = true,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
      { "gR", "<cmd>TroubleToggle lsp_references<cr>" },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    init = lazyLoad("null-ls.nvim"),
    config = function ()
      require("lsp.null")
    end,
  },
  {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    keys = {
      { "<leader>gt", "<cmd>Neogit<cr>" },
    },
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
}

require("lazy").setup({
  plugins,
}, {
  performance = {
    rtp = {
      disabled_plugins = disabledPlugins
    },
  },
  install = {
    colorscheme = { "catppuccin" }
  },
  defaults = {
    lazy = true,
  },
})

