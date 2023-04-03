return function()
  local status, animate = pcall(require, "mini.animate")
  local status1, flirt = pcall(require, "flirt")
  if (not status) then return end
  if (not status1) then return end

  animate.setup()
  flirt.setup()
end
