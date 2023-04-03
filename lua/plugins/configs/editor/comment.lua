return function()
  -- Set Comment.nvim as a "comment" variable if installed properly.
  local status, comment = pcall(require, "Comment")

  -- If it were not installed, return.
  if not status then
    return
  end

  -- Enable Comment.nvim
  comment.setup()
end
