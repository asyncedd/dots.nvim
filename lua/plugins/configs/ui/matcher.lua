local status, matchparen = pcall(require, "matchparen")
if (not status) then
  return
end

require('matchparen').setup()
