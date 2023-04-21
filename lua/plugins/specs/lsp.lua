local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lsp.mason")
    end,
    init = lazyLoad("mason.nvim")
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    init = lazyLoad("null-ls.nvim"),
    config = function()
      require("lsp.null")
    end,
  },
}
