return dots.languages.go ~= true and {}
  or {
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
  }
