-- lua/plugins/specs/tools.lua
--
--  ┌
--  │              Some tools for the best editor
--  └

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local function flash(prompt_bufnr)
        require("flash").jump({
          pattern = "^",
          highlight = { label = { after = { 0, 0 } } },
          search = {
            mode = "search",
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
              end,
            },
          },
          action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        })
      end
      return {
        defaults = {
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          winblend = 0,
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          color_devicons = true,
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            n = { ["q"] = require("telescope.actions").close, s = flash },
            i = { ["<c-s>"] = flash },
          },
        },
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)

      require("telescope").load_extension("fzy_native")

      require("telescope").load_extension("persisted")
    end,
    dependencies = {
      "nvim-treesitter",
      "nvim-web-devicons",
      "persisted.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "plenary.nvim",
    },
    keys = {
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find grep" },
      { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>>", desc = "Fuzzy find in buffer" },
    },
    cmd = "Telescope",
  },
  {
    "stevearc/aerial.nvim",
    opts = function()
      return require("plugins.configs.tools.aerial")
    end,
    config = true,
    cmd = {
      "AerialToggle",
    },
    keys = {
      { "<leader>tc", "<cmd>AerialToggle<CR>" },
    },
  },
  {
    "danielfalk/smart-open.nvim",
    dependencies = {
      "telescope.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "sqlite.lua",
    },
    branch = "0.2.x",
    keys = {
      {
        "<leader>ff",
        "<cmd>lua require('telescope').extensions.smart_open.smart_open({ cwd_only = true })<CR>",
        desc = "Find files",
      },
    },
  },
  {
    "echasnovski/mini.files",
    opts = {
      windows = {
        -- Whether to show preview of directory under cursor
        preview = true,
        width_preview = 100,
      },
    },
    init = function()
      -- vim.fn.argc() returns an integer on how much arguments that Neovim has been started with.
      --
      -- For ex.
      --
      -- "nvim" -> 0
      -- "nvim ." -> 1
      -- "nvim . ." -> 2
      -- "nvim 1 2 3 4 5 6 7 8 9 0" -> 10
      --
      -- So, using this, we'll check if vim.fn.argc() is 1 or over 1
      if vim.fn.argc() >= 1 then
        -- Get the information of the file/directory of vim.fn.argv(0)
        --
        -- vim.fn.argv(0) it self is the first argument that Neovim was started with.
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        -- loading it when the first argument is a directory.
        -- load "mini.files"
        if stat and stat.type == "directory" then
          require("lazy").load({ plugins = { "mini.files" } })
        end
      end
      -- If Neovim wasn't started with all of that, check if mini.files was loaded
      -- once, we load it, we don't have to load it twice, sooo...
      if not require("lazy.core.config").plugins["mini.files"]._.loaded then
        -- If it doesn't, create a new "BufNew" autocommand
        vim.api.nvim_create_autocmd("BufNew", {
          callback = function()
            -- If that file is a directory, load mini.files
            if vim.fn.isdirectory(vim.fn.expand("<afile>")) == 1 then
              require("lazy").load({ plugins = { "mini.files" } })
              -- Once oil is loaded, we can delete this autocmd
              return true
            end
          end,
        })
      end
    end,
    keys = {
      {
        "<leader>to",
        function()
          require("mini.files").open()
        end,
      },
    },
  },
  {
    "vuki656/package-info.nvim",
    opts = true,
    event = "VeryLazy",
  },
  {
    "NeogitOrg/neogit",
    opts = {
      disable_commit_confirmation = true,
      use_telescope = true,
      telescope_sorter = function()
        return require("telescope").extensions.fzf.native_fzf_sorter()
      end,
      integrations = {
        diffview = true,
      },
      signs = {
        -- { CLOSED, OPENED }
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
    },
    cmd = {
      "Neogit",
    },
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    init = function()
      -- HACK https://github.com/TimUntersberger/neogit/issues/405
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "NeogitCommitMessage",
        command = "silent! set filetype=gitcommit",
      })
    end,
  },
}
