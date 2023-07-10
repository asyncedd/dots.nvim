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
    event = {
      "VeryLazy",
    },
    enabled = dots.colorscheme == "catppuccin",
  },
  {
    "folke/tokyonight.nvim",
    opts = function()
      return require("plugins.configs.ui.tokyonight")
    end,
    config = true,
    event = {
      "VeryLazy",
    },
    enabled = dots.colorscheme == "tokyonight",
  },
  {
    "olimorris/onedarkpro.nvim",
    opts = function()
      return require("plugins.configs.ui.onedark")
    end,
    event = {
      "VeryLazy",
    },
    enabled = dots.colorscheme == "onedarkpro",
  },
  {
    "EdenEast/nightfox.nvim",
    opts = function()
      return require("plugins.configs.ui.nightfox")
    end,
    enabled = dots.colorscheme == "nightfox",
  },
  {
    "folke/noice.nvim",
    opts = {
      border = { style = "none" },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 2, 3 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
    },
    event = "VeryLazy",
    config = true,
    dependencies = {
      "nui.nvim",
      "nvim-notify",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "oil_preview",
        "vim",
      },
      use_treesitter = true,
    },
    event = "BufReadPost",
  },
  {
    "echasnovski/mini.indentscope",
    opts = function()
      return require("plugins.configs.ui.indentscope")
    end,
    event = "VeryLazy",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "oil_preview",
          "vim",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "echasnovski/mini.animate",
    opts = {
      scroll = {
        enable = false,
      },
      resize = {
        enable = false,
      },
    },
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
      "nvim-web-devicons",
    },
  },
  {
    "RRethy/vim-illuminate",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    event = "VeryLazy",
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
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
    "folke/todo-comments.nvim",
    opts = true,
    event = "VeryLazy",
  },
  {
    "edluffy/specs.nvim",
    opts = {
      popup = {
        winhl = "Cursor",
      },
    },
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
        tailwind = true,
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
  {
    "rcarriga/nvim-notify",
    config = function()
      local stages = require("notify.stages.fade_in_slide_out")("top_down")
      local notify = require("notify")
      notify.setup({
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { focusable = false })
        end,
        stages = {
          function(...)
            local opts = stages[1](...)
            if opts then
              opts.border = "solid"
            end
            return opts
          end,
          unpack(stages, 2),
        },
      })
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = true,
    event = "VeryLazy",
  },
  {
    "folke/which-key.nvim",
    opts = {
      triggers_blacklist = {
        n = { "<leader>g", "<leader>n" },
      },
    },
    dependencies = "hydra.nvim",
    event = "VeryLazy",
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
        },
      })
    end,
    event = "User UI",
  },
  {
    "levouh/tint.nvim",
    opts = function()
      return {
        highlight_ignore_patterns = { "WinSeparator", "Status.*" }, -- Highlight group patterns to ignore, see `string.find`
        window_ignore_function = function(winid)
          local bufid = vim.api.nvim_win_get_buf(winid)
          local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
          local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

          -- Do not tint `terminal` or floating windows, tint everything else
          return buftype == "terminal" or floating
        end,
      }
    end,
    event = "VeryLazy",
  },
  {
    "nacro90/numb.nvim",
    opts = true,
    event = "CmdlineEnter",
  },
  {
    "lewis6991/satellite.nvim",
    opts = true,
    event = "VeryLazy",
  },
  {
    "folke/zen-mode.nvim",
    opts = true,
    dependencies = "twilight.nvim",
    cmd = { "ZenMode" },
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
    event = "BufRead",
    enabled = dots.UI.rainbow_delimiters,
  },
}
