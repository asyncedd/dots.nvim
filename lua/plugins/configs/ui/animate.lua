local animate = require("mini.animate")

local mouse_scrolled = false
for _, scroll in ipairs({ "Up", "Down" }) do
  local key = "<ScrollWheel" .. scroll .. ">"
  vim.keymap.set("", key, function()
    mouse_scrolled = true
    return key
  end, { noremap = true, expr = true })
end

animate.setup({
  cursor = {
    -- Animate for 200 milliseconds with linear easing
    timing = animate.gen_timing.linear({ duration = 200, unit = "total" }),
  },

  scroll = {
    enable = false,
    timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
    subscroll = animate.gen_subscroll.equal({
      predicate = function(total_scroll)
        if mouse_scrolled then
          mouse_scrolled = false
          return false
        end
        return total_scroll > 1
      end,
    }),
  },
})
