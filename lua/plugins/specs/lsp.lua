return {
  {
    "williamboman/mason.nvim",
    after = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = function()
          return require("plugins.configs.lsp.mason-lsp")
        end,
        config = true,
      },
    },
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lsp.config")

      require("plugins.configs.lsp.native")
    end,
    dependencies = {
      "mason.nvim",
    },
    init = function()
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWinEnter", "BufWinLeave" }, {
        callback = function()
          vim.schedule(function()
            local file = vim.fn.expand "%"
            local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""
            if condition then
              require("lazy").load({ plugins = "nvim-lspconfig" })
              vim.cmd("silent! do FileType")
            end
          end)
        end,
      })
    end,
  },
}
