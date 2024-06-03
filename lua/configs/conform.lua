local options = {
  format_on_save = { timeout_ms = 500, lsp_fallback = true },
  formatters_by_ft = {
    c = { "clang_format" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    fish = { "fish_indent" },
    nix = { "alejandra" },
    markdown = { { "prettierd", "prettier" } },
    lua = { "stylua" },
    svelte = { { "prettierd", "prettier" } },
  },
}

return options
