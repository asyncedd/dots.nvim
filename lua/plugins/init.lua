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
-- Lazy load a plugin.
---@param plugin string: A plugin to load.
local lazyLoad = function(plugin) -- CREDIT: NvChad.
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
          vim.schedule(function() require("lazy").load({ plugins = plugin })

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
      config = function()
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
      require("editor.treesitter")
    end,
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
    },
  },
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "off" }
    end,
    init = lazyLoad("vim-matchup"),
  },
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
        build = "<cmd>Mason<cmd>",
        cmd = {
          "Mason",
        },
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
        },
        -- event = "BufReadPre",
      },
      "folke/neodev.nvim",
      {
        "glepnir/lspsaga.nvim",
        config = function()
          require("lsp.saga")
        end,
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          { "nvim-treesitter/nvim-treesitter" },
        },
      },
      "SmiteshP/nvim-navbuddy",
      "MunifTanjim/nui.nvim",
      "SmiteshP/nvim-navic",
    },
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
        },
      },
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      {
        "jcdickinson/codeium.nvim",
        config = true,
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
      },
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        dependencies = {
          "hrsh7th/nvim-cmp",
        },
      },
      "hrsh7th/cmp-nvim-lua",
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
    dependencies = {
      "ggandor/flit.nvim",
      config = true,
      dependencies = "tpope/vim-repeat",
    },
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
    event = "BufReadPre",
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
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", function() require("spider").motion("w") end, { "n", "o", "x" } },
      { "e", function() require("spider").motion("e") end, { "n", "o", "x" } },
      { "b", function() require("spider").motion("b") end, { "n", "o", "x" } },
      { "ge", function() require("spider").motion("ge") end, { "n", "o", "x" } },
    },
  },
  {
    "glepnir/dashboard-nvim",
    config = true,
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "VidocqH/lsp-lens.nvim",
    config = function()
      require("lsp-lens").setup({})
    end,
    event = "VeryLazy",
  },
  {
    "rafcamlet/nvim-luapad",
    lazy = true,
    cmd = {
      "Luapad",
      "LuaRun",
      "Lua",
    },
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require('aerial').setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
        end
      })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
    end,
    event = "VeryLazy",
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jbyuki/one-small-step-for-vimkind",
      "rcarriga/nvim-dap-ui",
    },
    keys = {
      { "<leader>bp", function() require("dap").toggle_breakpoint() end },
      { "<leader>dc", function() require("dap").continue() end },
      { "<leader>so", function() require("dap").step_over() end },
      { "<leader>si", function() require("dap").step_into() end },
      { "<leader>uh", function() require("dap.ui.widgets").hover() end },
      { "<leader>ol", function() require("osv").launch({ port = 8086} ) end },
      { "<leader>runit", function() require("osv").run_this() end },
    },
    config = function()
      require("dap.dap")
    end,
  },
  {
    "michaelb/sniprun",
    build = "bash install.sh",
    cmd = {
      "SnipRun",
      "SnipInfo",
      "SnipClose",
      "SnipReplMemoryClean",
      "SnipReset",
    },
    keys = {
      { "<leader>sp", ":SnipRun<cr>", mode = { "v", "n" } },
    },
  },
  {
    "folke/noice.nvim",
    config = function()
      require("ui.noice")
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
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
    colorscheme = {
      "catppuccin",
      "habamax",
    }
  },
  defaults = {
    lazy = true,
    version = false,
  },
})

