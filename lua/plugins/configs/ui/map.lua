local map = require("mini.map")

map.setup({
  integrations = {
    map.gen_integration.gitsigns(),
    map.gen_integration.diagnostic(),
    map.gen_integration.builtin_search(),
  },
})

MiniMap.open()
