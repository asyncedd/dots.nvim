return {
  {
    "mfussenegger/nvim-dap",
    opts = {
      adapters = {
        "delve",
        "debugpy",
        "codelldb",
      },
    },
    config = function(_, opts)
      local adapters_to_install = opts.adapters

      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(adapters_to_install) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
      -- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
      require("dap")

      local sign = vim.fn.sign_define

      sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
    end,
    keys = {
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function()
          require("dap").goto_()
        end,
        desc = "Go to line (no execute)",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>dj",
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function()
          require("dap").up()
        end,
        desc = "Up",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>do",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
      {
        "<leader>dpr",
        function()
          local ft = vim.bo.filetype

          if ft == "python" then
            require("lazy").load({ plugins = "nvim-dap-python" })
            require("dap-python").test_method()
          elseif ft == "lua" then
            require("lazy").load({ plugins = "one-small-step-for-vimkind" })
            require("osv").run_this()
          elseif ft == "go" then
            require("lazy").load({ plugins = "nvim-dap-go" })
            require("dap-go").debug_test()
          end
        end,
      },
    },
    dependencies = {
      "nvim-dap-ui",
      "nvim-dap-virtual-text",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "Dap UI",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Eval",
        mode = { "n", "v" },
      },
    },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      local python_env = function()
        for _, client in pairs(vim.lsp.get_active_clients()) do
          if client.name == "pyright" then
            return client.config.settings.python
          end
        end
        return nil
      end

      local dap_py = require("dap-python")
      dap_py.resolve_python = function()
        local env = python_env()
        if env then
          return env.pythonPath
        else
          return "python"
        end
      end
      dap_py.setup()
    end,
    dependencies = "nvim-dap",
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
        callback = function()
          if vim.bo.filetype == "python" then
            vim.schedule(function()
              require("lazy").load({ plugins = "nvim-dap-python" })
            end)
          end
        end,
      })
    end,
  },
  {
    "jbyuki/one-small-step-for-vimkind",
    -- stylua: ignore
    keys = {
    },
    config = function()
      local dap = require("dap")
      dap.adapters.nlua = function(callback, config)
        callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or "${port}" })
      end
      dap.configurations.lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to running Neovim instance",
        },
      }
    end,
    dependencies = "nvim-dap",
  },
  {
    "leoluz/nvim-dap-go",
    opts = {
      -- Additional dap configurations can be added.
      -- dap_configurations accepts a list of tables where each entry
      -- represents a dap configuration. For more details do:
      -- :help dap-configuration
      dap_configurations = {
        {
          -- Must be "go" or it will be ignored by the plugin
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      -- delve configurations
      delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}",
        -- additional args to pass to dlv
        args = {},
      },
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
        callback = function()
          if vim.bo.filetype == "go" then
            require("lazy").load({ plugins = "nvim-dap-go" })
          end
        end,
      })
    end,
    dependencies = "nvim-dap",
  },
  {
    "mfussenegger/nvim-dap",
    opts = {
      setup = {
        codelldb = function()
          local function get_codelldb()
            local mason_registry = require("mason-registry")
            local codelldb = mason_registry.get_package("codelldb")
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
            return codelldb_path, liblldb_path
          end

          local codelldb_path, _ = get_codelldb()
          local dap = require("dap")
          dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
              command = codelldb_path,
              args = { "--port", "${port}" },

              -- On windows you may have to uncomment this:
              -- detached = false,
            },
          }
          dap.configurations.cpp = {
            {
              name = "Launch file",
              type = "codelldb",
              request = "launch",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
            },
          }

          dap.configurations.c = dap.configurations.cpp
          dap.configurations.rust = dap.configurations.cpp
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = {
      setup = {
        codelldb = function()
          local function get_codelldb()
            local mason_registry = require("mason-registry")
            local codelldb = mason_registry.get_package("codelldb")
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
            return codelldb_path, liblldb_path
          end
          local codelldb_path, _ = get_codelldb()
          local dap = require("dap")
          dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
              command = codelldb_path,
              args = { "--port", "${port}" },

              -- On windows you may have to uncomment this:
              -- detached = false,
            },
          }
          dap.configurations.cpp = {
            {
              name = "Launch file",
              type = "codelldb",
              request = "launch",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
            },
          }

          dap.configurations.c = dap.configurations.cpp
          dap.configurations.rust = dap.configurations.cpp
        end,
      },
    },
  },
}
