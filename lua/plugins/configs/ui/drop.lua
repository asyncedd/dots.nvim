math.randomseed(os.time())
local theme = ({ "stars", "snow", "xmas", "leaves", "spring", "summer" })[math.random(1, 6)]

return {
  theme = theme,
}
