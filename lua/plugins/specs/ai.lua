return {
  {
    "jcdickinson/codeium.nvim",
    opts = true,
  },
  {
    "tzachar/cmp-tabnine",
    opts = {
      -- Add options here.
      -- If you're curious about the options check: https://github.com/tzachar/cmp-tabnine
      max_lines = 500,
      -- For example if you want to show the prediction strength (which isn't possible because of the cmp config) you can:
      -- show_prediction_strength = true
      -- NOTE: This doesn't work because of the current nvim-cmp config
    },
    config = function(_, opts)
      require("cmp_tabnine.config"):setup(opts)

      -- Tabnine allows prefetching results before the User asks for completions so, we'll be prefetching it for the current file.
      require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))

      -- And on BufRead (Which will not be executed on the initial load since the Autocmd is created on VeryLazy) we'll make it so, it'll prefetch too.
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("prefetch", { clear = true }),
        callback = function()
          require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))
        end,
      })
    end,
    build = function()
      if not jit.os:find("Windows") then
        return "./install.sh"
      else
        return "powershell ./install.ps1"
      end
    end,
  },
}
