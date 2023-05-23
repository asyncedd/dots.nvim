local C = require("catppuccin.palettes").get_palette()

return {
  colors = {
    copy = C.blue,
    delete = C.red,
    insert = C.green,
    visual = C.pink,
  },
  set_cursorline = true,
  set_number = true,
}
