return function(opts)
  local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

  require("mason").setup(opts.ensure_installed)
  local mr = require("mason-registry")
  local function ensure_installed()
    for _, tool in ipairs(opts.ensure_installed) do
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

  require("null-ls").setup({
    sources = opts.sources,
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
