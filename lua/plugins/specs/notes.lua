return {
  {
    "nvim-neorg/neorg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              work = "~/notes/work",
              home = "~/notes/home",
            },
          },
        },
        ["core.concealer"] = {},
        ["core.autocommands"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.integrations.zen_mode"] = {},
        ["core.integrations.telescope"] = {},
        ["core.clipboard"] = {},
        ["core.clipboard.code-blocks"] = {},
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
        ["core.keybinds"] = {},
        ["core.mode"] = {},
        ["core.neorgcmd"] = {},
        ["core.queries.native"] = {},
        ["core.ui"] = {},
        ["core.summary"] = {},
        ["core.itero"] = {},
      },
    },
    config = function(_, opts)
      require("neorg").setup(opts)

      local neorg_callbacks = require("neorg.callbacks")

      neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode("norg", {
          n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
          },

          i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
          },
        }, {
          silent = true,
          noremap = true,
        })
      end)
    end,
    dependencies = {
      "plenary.nvim",
      "nvim-neorg/neorg-telescope",
    },
    init = function()
      local setup_fn = function()
        require("lazy").load({ plugins = { "neorg" } })
      end

      local filename = vim.api.nvim_buf_get_name(0)
      local extension = vim.fn.fnamemodify(filename, ":e")

      if extension == "norg" then
        setup_fn()
      end

      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
        callback = function()
          filename = vim.api.nvim_buf_get_name(0)
          extension = vim.fn.fnamemodify(filename, ":e")

          if extension == "norg" then
            setup_fn()
          end
        end,
      })
    end,
    enabled = dots.notes.neorg,
  },
}
