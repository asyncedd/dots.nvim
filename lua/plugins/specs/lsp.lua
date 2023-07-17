return not dots.LSP.enabled and {} or {
  {
    "neovim/nvim-lspconfig",
    opts = dots.LSP.opts,
    config = function(_, opts)
      local M = {}

      M.on_attach = function()
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint(bufnr, true)
            end
          end,
        })
      end

      M.setup = function(opts)
        local servers_to_not_setup = opts.servers_to_not_setup

        local capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities = vim.tbl_deep_extend("force", capabilities, {
          offsetEncoding = { "utf-16" },
          general = {
            positionEncodings = { "utf-16" },
          },
        })

        capabilities.textDocument = {
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
        }

        local checkIfExists = function(val, arr)
          local y = false
          for i in ipairs(arr) do
            if arr[i] == val and y ~= true then
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
        -- get all the servers that are available thourgh mason-lspconfig
        local have_mason, mlsp = pcall(require, "mason-lspconfig")
        local all_mslp_servers = {}
        if have_mason then
          all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
        end

        local ensure_installed = {} ---@type string[]

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

      return M
    end,
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
        callback = function()
          vim.schedule(function()
            require("lazy").load({ plugins = "nvim-lspconfig" })
          end)
        end,
      })
    end,
  },
}
