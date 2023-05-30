return {
  highlighters = {
    word_color = {
      pattern = "%S+",
      group = function(_, match)
        local M = {}

        M.C = require("catppuccin.palettes").get_palette()

        M.hipatterns = require("mini.hipatterns")

        M.words = {
          rosewater = M.C.rosewater,
          flamingo = M.C.flamingo,
          pink = M.C.pink,
          mauve = M.C.mauve,
          red = M.C.red,
          maroon = M.C.maroon,
          peach = M.C.peach,
          yellow = M.C.yellow,
          green = M.C.green,
          teal = M.C.teal,
          sky = M.C.sky,
          sapphire = M.C.sapphire,
          blue = M.C.blue,
          lavender = M.C.lavender,
          text = M.C.text,
          subtext1 = M.C.subtext1,
          subtext0 = M.C.subtext0,
          overlay2 = M.C.overlay2,
          overlay1 = M.C.overlay1,
          overlay0 = M.C.overlay0,
          surface2 = M.C.surface2,
          surface1 = M.C.surface1,
          surface0 = M.C.surface0,
          base = M.C.base,
          mantle = M.C.mantle,
          crust = M.C.crust,
        }

        local hex = M.words[match]
        if hex == nil then
          return nil
        end
        return M.hipatterns.compute_hex_color_group(hex, "bg")
      end,
    },
    tailwind = {
      pattern = require("plugins.configs.ui.hipatterns.tailwind").pattern,
      group = require("plugins.configs.ui.hipatterns.tailwind").group,
    },
  },
}
