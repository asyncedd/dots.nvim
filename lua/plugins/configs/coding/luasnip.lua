return {
  history = true, -- Allow snippets that were exited, to be jumped back again.

  -- Update active nodes on textchange.
  update_events = {
    "TextChanged",
    "TextChangedI",
  },
}
