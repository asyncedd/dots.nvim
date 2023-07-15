return not dots.goodies.tree and {}
  or {
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },
        open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
        filesystem = {
          bind_to_cwd = false,
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
        window = {
          mappings = {
            ["<space>"] = "none",
          },
        },
        default_component_configs = {
          indent = {
            with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_empty = "󰜌",
            folder_empty_open = "󰜌",
          },
          git_status = {
            symbols = {
              renamed = "󰁕",
              unstaged = "󰄱",
            },
          },
        },
      },
      cmd = {
        "Neotree",
      },
      keys = {
        { "<leader>tn", "<cmd>Neotree<CR>" },
      },
      enabled = dots.goodies.tree.neotree,
    },
    {
      "nvim-tree/nvim-tree.lua",
      opts = {},
      cmd = {
        "NvimTreeToggle",
      },
      keys = {
        { "<leader>tn", "<cmd>NvimTreeToggle<CR>" },
      },
      enabled = dots.goodies.tree.nvim_tree,
    },
    {
      "ms-jpq/chadtree",
      branch = "chad",
      build = "python3 -m chadtree deps",
      cmd = {
        "CHADopen",
      },
      keys = {
        { "<leader>tn", "<cmd>CHADopen<CR>" },
      },
      enabled = dots.goodies.tree.chadtree,
    },
  }
