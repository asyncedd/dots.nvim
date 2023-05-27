return function(opts)
  local capabilities = vim.lsp.protocol.make_client_capabilities()

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
    inlayHint = true,
  }

  local servers = opts.servers

  local setup = function(server)
    local server_opts = vim.tbl_deep_extend("force", {
      capabilities = vim.deepcopy(capabilities),
    }, servers[server] or {})
    require("lspconfig")[server].setup({ settings = server_opts })
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
