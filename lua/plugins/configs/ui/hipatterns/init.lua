return {
  highlighters = {
    word_color = {
      pattern = "%S+",
      group = function(_, match)
        local hipatterns = require("mini.hipatterns")

        local words = require("plugins.configs.ui.hipatterns.words." .. require("settings.settings").colorscheme)

        local hex = words[match]
        if hex == nil then
          return nil
        end
        return hipatterns.compute_hex_color_group(hex, "bg")
      end,
    },
    tailwind = {
      pattern = require("plugins.configs.ui.hipatterns.tailwind").pattern,
      group = require("plugins.configs.ui.hipatterns.tailwind").group,
    },
  },
}
