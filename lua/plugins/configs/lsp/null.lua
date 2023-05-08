local nls = require("null-ls")
local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

return {
  sources = {
    nls.builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = group,
        buffer = bufnr,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
