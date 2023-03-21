return {
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      library = {
	[vim.fn.expand("$VIMRUNTIME/lua")] = true,
	[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
	[vim.fn.expand("data" .. "/lazy/lazy.nvim/lua/lazy")] = true,
      },
      MaxPreload = 100000,
      preloadFileSize = 10000,
    },
  }
}
