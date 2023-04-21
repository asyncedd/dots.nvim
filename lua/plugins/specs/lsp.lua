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
    "glepnir/lspsaga.nvim",
    config = true,
    -- init = lazyLoad("lspsaga.nvim"),
  },
}
