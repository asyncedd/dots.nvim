return {
  highlighters = {
    word_color = {
      pattern = "%S+",
      group = function(_, match)
        local hipatterns = require("mini.hipatterns")

        local status, words =
          pcall(require, "plugins.configs.ui.hipatterns.words." .. require("settings.settings").colorscheme)

        if not status then
          print("Unknown colorscheme: " .. require("settings.settings").colorscheme)
          words = require("plugins.configs.ui.hipatterns.words.catppuccin")
        end

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
