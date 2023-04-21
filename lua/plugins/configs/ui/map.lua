local map = require("mini.map")
local integration = map.gen_integration

map.setup({
  integrations = {
    integration.builtin_search(),
    integration.gitsigns(),
    integration.diagnostic(),
  },
})

map.toggle()
