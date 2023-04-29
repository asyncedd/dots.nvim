local starter = require('mini.starter')

local footer_n_seconds = (function()
  local timer = vim.loop.new_timer()
  local n_seconds = 0
  timer:start(0, 1000, vim.schedule_wrap(function()
    if vim.api.nvim_buf_get_option(0, "filetype") ~= "starter" then
      timer:stop()
      return
    end
    n_seconds = n_seconds + 1
    MiniStarter.refresh()
  end))

  return function()
    return "Number of seconds since opening: " .. n_seconds
  end
end)()

return {
  header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
  ]],
  evaluate_single = true,
  items = {
    starter.sections.builtin_actions(),
    starter.sections.telescope,
    starter.sections.recent_files(5, false),
    starter.sections.recent_files(5, true),
    starter.sections.sessions
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.aligning("center", "center"),
  },
  footer = footer_n_seconds,
}
