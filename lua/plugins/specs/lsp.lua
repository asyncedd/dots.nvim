local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("plugins.configs.lsp.mason")
    end,
    init = lazyLoad("mason.nvim")
  },
}
