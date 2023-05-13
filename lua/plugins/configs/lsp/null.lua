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
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = group,
        buffer = bufnr,
      })

      vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
