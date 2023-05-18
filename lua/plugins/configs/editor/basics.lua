return {
  options = {
    -- NOTE: explicitly disable options since, I want all control over it.
    basic = false,
    extra_ui = false,
    win_borders = "none",
  },
  mappings = {
    -- Enables basic mappings though
    basic = true,
    -- HACK: Disables it since, we've already added em'
    windows = false,
    -- HACK: Disables this since, it conflicts with readline motions
    move_with_alt = false,
  },
  autocommands = {
    -- Disble basic motions though
    basic = false,
  },
}
