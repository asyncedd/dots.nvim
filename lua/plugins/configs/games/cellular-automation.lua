local config = {
  fps = 50,
  name = "slide",
}

-- init function is invoked only once at the start
-- config.init = function (grid)
--
-- end

-- update function
config.update = function(grid)
  for i = 1, #grid do
    local prev = grid[i][#grid[i]]
    for j = 1, #grid[i] do
      grid[i][j], prev = prev, grid[i][j]
    end
  end
  return true
end

require("cellular-automaton").register_animation(config)
