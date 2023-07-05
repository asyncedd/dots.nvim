return {
  {
    "akinsho/bufferline.nvim",
    opts = function()
      return require("plugins.configs.buffer.bufferline")
    end,
    config = true,
    dependencies = {
      "nvim-web-devicons",
      {
        "echasnovski/mini.bufremove",
      },
      { "tiagovla/scope.nvim", opts = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local load_bufferline = function()
            require("lazy").load({ plugins = "bufferline.nvim" })
          end
          if vim.fn.argc() > 1 then
            load_bufferline()
          else
            vim.schedule(function()
              load_bufferline()
            end)
          end
        end,
      })
    end,
    keys = {
      { "gbb", "<cmd>BufferLinePick<CR>", desc = "Toggle Buffer picker" },
      { "gbp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Buffer pin" },
      { "gbd", "<cmd>lua require('mini.bufremove').delete(0, false)<CR>", desc = "Delete current buffer" },
      { "gbc", "<cmd>BufferLinePickClose<CR>", desc = "Toggle buffer picker closer" },
      { "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Cycle to the next buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Cycle to the prev buffer" },
      {
        "<leader>b",
        function()
          require("bufferline").go_to(vim.v.count or 1)
        end,
      },
    },
  },
}
