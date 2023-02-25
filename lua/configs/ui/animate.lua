return function()
  local status, animate = pcall(require, "mini.animate")
  if (not status) then return end

  animate.setup()
end
