local lazy = require("lazy")

-- Lazy load a plugin.
---@param plugin string: A plugin to load.
local lazyLoad = function(plugin) -- CREDIT: NvChad.
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand("%")
      local condition = (file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= "")

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

        -- dont defer for treesitter as it will show slow highlighting
        -- This deferring only happens only when we do "nvim filename"
        if plugin ~= "nvim-treesitter" then
          vim.schedule(function()
            lazy.load({ plugins = plugin })

            if plugin == "nvim-lspconfig" or plugin == "null-ls" then
              vim.api.nvim_command("silent! do FileType")
            end
          end)
        else
          lazy.load({ plugins = plugin })
        end
      end
    end,
  })
end

return lazyLoad
