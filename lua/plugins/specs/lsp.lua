return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "lua-language-server",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            print(" Installing " .. tool)
            p:install()
            print(" Installed " .. tool)
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
    event = { "User LSP", },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lsp.cfg")
      require("plugins.configs.lsp.config")
    end,
    event = { "User LSP" },
  },
}
