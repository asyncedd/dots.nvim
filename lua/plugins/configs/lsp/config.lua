local M = {}

M.on_attach = function(client, buffer)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.buf.inlay_hint(buffer, true)
  end
end

M.setup = function(opts)
  local servers_to_not_setup = opts.servers_to_not_setup

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

  local setup = function(server)
    if not checkIfExists(server, servers_to_not_setup) then
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
        on_attach = M.on_attach,
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
