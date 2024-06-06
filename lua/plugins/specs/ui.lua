return {
  {
    "NvChad/base46",
    branch = "v2.5",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "NvChad/ui",
    branch = "v2.5",
    lazy = false,
    config = function()
      require("nvchad")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User LazyFile",
    opts = {
      indent = { highlight = "IblChar" },
      scope = { highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return { override = require("nvchad.icons.devicons") }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "devicons")
      require("nvim-web-devicons").setup(opts)
    end,
  },
  {
    "echasnovski/mini.notify",
    opts = {
      window = {
        config = {
          border = "none",
        },
        winblend = 0,
      },
    },
    config = function(_, opts)
      local notify = require("mini.notify")
      notify.setup(opts)
      vim.notify = notify.make_notify({
        ERROR = { duration = 5000 },
        WARN = { duration = 4000 },
        INFO = { duration = 3000 },
      })
    end,
    init = function()
      vim.notify = function(...)
        if not require("lazy.core.config").plugins["mini.notify"]._.loaded then
          require("lazy").load({ plugins = "mini.notify" })
        end
        vim.notify(...)
      end
    end,
    event = "LspAttach",
  },
  -- CREDITS TO: https://www.lazyvim.org/plugins/ui#dressingnvim
  {
    "stevearc/dressing.nvim",
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
}
