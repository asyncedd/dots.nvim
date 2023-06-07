-- lua/plugins/specs/core.lua
--
--  ┌
--  │  Plugins that are usually dependencies of other plugins
--  └

return {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
  "kkharji/sqlite.lua",
  "stevearc/dressing.nvim",
  "tpope/vim-repeat",
  {
    "rcarriga/nvim-notify",
    config = function()
      local stages = require("notify.stages.fade_in_slide_out")("top_down")
      local notify = require("notify")
      notify.setup({
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { focusable = false })
        end,
        stages = {
          function(...)
            local opts = stages[1](...)
            if opts then
              opts.border = "none"
            end
            return opts
          end,
          unpack(stages, 2),
        },
      })
    end,
  },
}
