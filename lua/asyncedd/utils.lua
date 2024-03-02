local M = {}

function M.event(event, delay)
  local emit_event = function()
    vim.api.nvim_exec_autocmds("User", { pattern = event, modeline = false })
  end
  if delay == false then
    emit_event()
  else
    vim.schedule(emit_event)
  end
end

return M
