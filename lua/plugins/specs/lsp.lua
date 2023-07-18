return not dots.LSP.enabled and {}
  or {
    {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers_to_not_setup = dots.LSP.config.opts.servers_to_not_setup or {},
          servers = dots.LSP.config.opts.servers or {},
          setup = dots.LSP.config.opts.setup or {},
        },
        enabled = dots.LSP.config.enabled,
        config = function(_, opts)
          vim.cmd("silent! do FileType")
          local M = {}

          M.on_attach = dots.LSP.on_attach

          M.setup = function()
            local servers_to_not_setup = opts.servers_to_not_setup

            local capabilities = vim.lsp.protocol.make_client_capabilities()

            capabilities = vim.tbl_deep_extend("force", capabilities, {
              offsetEncoding = { "utf-16" },
              textDocument = {
                completion = {
                  completionItem = {
                    documentationFormat = { "markdown", "plaintext" },
                    snippetSupport = true,
                    preselectSupport = true,
                    insertReplaceSupport = true,
                    labelDetailsSupport = true,
                    deprecatedSupport = true,
                    commitCharactersSupport = true,
                    tagSupport = { valueSet = { 1 } },
                    resolveSupport = {
                      properties = {
                        "documentation",
                        "detail",
                        "additionalTextEdits",
                      },
                    },
                  },
                },
                foldingRange = {
                  dynamicRegistration = false,
                  lineFoldingOnly = true,
                },
              },
            })

            local checkIfExists = function(val, arr)
              local y = false
              for i, v in ipairs(arr) do
                if v == val and y ~= true then
                  y = true
                end
              end
              return y
            end

            local servers = opts.servers

            local function setup(server)
              if not checkIfExists(server, servers_to_not_setup) then
                local server_opts = vim.tbl_deep_extend("force", {
                  capabilities = vim.deepcopy(capabilities),
                }, servers[server] or {})

                if opts.setup[server] then
                  if opts.setup[server](server, server_opts) then
                    return
                  end
                elseif opts.setup["*"] then
                  if opts.setup["*"](server, server_opts) then
                    return
                  end
                end
                require("lspconfig")[server].setup(server_opts)
                M.on_attach()
              end
            end

            -- get all the servers that are available through mason-lspconfig
            local have_mason, mlsp = pcall(require, "mason-lspconfig")
            local all_mslp_servers = {}
            if have_mason then
              all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
            end

            local ensure_installed = {}

            for server, server_opts in pairs(servers) do
              server_opts = server_opts == true and {} or server_opts
              if not vim.tbl_contains(all_mslp_servers, server) then
                setup(server)
              else
                ensure_installed[#ensure_installed + 1] = server
              end
            end

            if have_mason then
              mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
            end
          end

          M.setup()
        end,
        dependencies = {
          {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
              {
                "williamboman/mason.nvim",
                opts = true,
              },
            },
          },
        },
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {},
      },
      enabled = dots.LSP.null.enabled,
      event = "VeryLazy",
      config = function(_, opts)
        vim.cmd("silent! do FileType")
        local function get_source_by_name(name)
          local cats = {
            diagnostics = {},
            formatting = {},
            code_actions = {},
            hover = {},
            completion = {},
            _test = {},
          }

          for m, t in pairs(cats) do
            local ok, builtin = pcall(require, string.format("null-ls.builtins.%s.%s", m, name))
            if ok then
              return (type(name) == "table" and next(name) ~= nil) and builtin.with(t) or builtin
            end
          end
        end

        local function ensure_installed(names)
          local mr = require("mason-registry")
          for _, tool in ipairs(names) do
            local ok, p = pcall(mr.get_package, tool)
            if ok and not p:is_installed() then
              p:install()
            end
          end
        end

        local sources = opts.sources
        local list_of_sources = {}

        for i in ipairs(sources) do
          local source = sources[i]
          if source.name ~= nil then
            table.insert(list_of_sources, source)
          end
        end

        for name, config in pairs(sources) do
          local source = get_source_by_name(name)
          if source then
            table.insert(
              list_of_sources,
              (type(config) == "table" and next(config) ~= nil) and source.with(config) or source
            )
          end
        end

        local names = {}
        for _, source in ipairs(list_of_sources) do
          local name = source.name:gsub("_", "-")
          table.insert(names, name)
        end

        ensure_installed(names)
        require("mason").setup(names)

        local augroup = vim.api.nvim_create_augroup("NullLsFormatting", { clear = true })

        require("null-ls").setup({
          sources = list_of_sources,
          on_attach = function(client, bufnr)
            if
              client.config
              and client.config.capabilities
              and client.config.capabilities.documentFormattingProvider == false
            then
              return
            end

            if client.supports_method("textDocument/formatting") then
              vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
              })
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({
                    bufnr = bufnr,
                    timeout_ms = 5000,
                    filter = function(clientn)
                      return clientn.name == "null-ls"
                    end,
                  })
                end,
              })
              dots.LSP.on_attach()
            end
          end,
        })
      end,
      dependencies = "nvim-lua/plenary.nvim",
    },
  }
