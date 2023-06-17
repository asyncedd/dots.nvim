return function(plugin)
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
    callback = function()
      if vim.fn.expand("%") ~= "" and vim.bo.filetype ~= "lazy" then
        -- dont defer for treesitter as it will show slow highlighting
        -- This deferring only happens only when we do "nvim filename"
        if plugin ~= "nvim-treesitter" then
          vim.schedule(function()
            require("lazy").load({ plugins = plugin })

            if plugin == "nvim-lspconfig" or plugin == "null-ls.nvim" or plugin == "vim-matchup" then
              vim.cmd("silent! do FileType")

              if plugin == "null-ls.nvim" then
                require("null-ls.state").register_conditional_sources()
              end
            end
          end)
        else
          require("lazy").load({ plugins = plugin })
        end
      end
    end,
  })
end
