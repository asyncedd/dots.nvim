local nls = require("null-ls")
local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

return {
  sources = {
    nls.builtins.formatting.stylua.with({
      condition = function(utils)
        return utils.root_has_file({ "stylua.toml" })
      end,
    }),
    nls.builtins.formatting.beautysh.with({
      extra_args = { "-i", "2" },
    }),
    nls.builtins.formatting.prettier,
  },
  on_attach = function(client, bufnr)
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
}
