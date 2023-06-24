return function(opts)
  local names = {}
  local sources = opts.sources

  for i in ipairs(sources) do
    table.insert(names, sources[i].name)
  end

  local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

  require("mason").setup(names)
  local mr = require("mason-registry")
  local function ensure_installed()
    for _, tool in ipairs(names) do
      local ok, p = pcall(mr.get_package, tool)
      if ok then
        if not p:is_installed() then
          p:install()
        end
      end
    end
  end
  if mr.refresh then
    mr.refresh(ensure_installed)
  else
    ensure_installed()
  end

  require("null-ls").setup({
    sources = sources,
    on_attach = function(client)
      if
        client.config
        and client.config.capabilities
        and client.config.capabilities.documentFormattingProvider == false
      then
        return
      end
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = group,
          callback = function()
            local buf = vim.api.nvim_get_current_buf()
            local ft = vim.bo[buf].filetype
            local have_nls = package.loaded["null-ls"]
              and (#require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0)

            vim.lsp.buf.format(vim.tbl_deep_extend("force", {
              bufnr = buf,
              filter = function(clientn)
                if have_nls then
                  return clientn.name == "null-ls"
                end
                return clientn.name ~= "null-ls"
              end,
            }, {}))
          end,
        })
      end
    end,
  })
end
