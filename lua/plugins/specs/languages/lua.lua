return {
  {
    "folke/lazydev.nvim",
    init = function()
      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("LoadLazyFile", { clear = true }),
        pattern = "LazyFile",
        callback = function()
          local function load_lazydev()
            if not require("lazy.core.config").plugins["lazydev.nvim"]._.loaded then
              require("lazy").load({ plugins = "lazydev.nvim" })
            end
          end
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "*.lua" },
            callback = load_lazydev,
          })
          if vim.bo.filetype == "lua" then
            load_lazydev()
          end
        end,
      })
    end,
    opts = {
      library = {
        "ui/nvchad_types",
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        "lazy.nvim",
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  { -- optional completion source for require statements and module annotations
    "nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
}
