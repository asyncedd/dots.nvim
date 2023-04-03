return function()
  local status, leap = pcall(require, "leap")
  if (not status) then return end

  leap.add_default_mappings()

  flit.setup({
    keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    -- A string like "nv", "nvo", "o", etc.
    labeled_modes = "v",
    multiline = true,
    -- Like `leap`s similar argument (call-specific overrides).
    -- E.g.: opts = { equivalence_classes = {} }
    opts = {}
  })
end
