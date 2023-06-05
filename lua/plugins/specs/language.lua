return {
  {
    "olexsmir/gopher.nvim",
    opts = true,
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
        callback = function()
          if vim.bo.filetype == "go" then
            vim.schedule(function()
              require("lazy").load({ plugins = "gopher.nvim" })
              vim.cmd("silent! do FileType")
            end)
          end
        end,
      })
    end,
    build = function()
      vim.cmd("GoInstallDeps")
    end,
  },
}
