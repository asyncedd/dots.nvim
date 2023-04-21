require("luasnip").config.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        virt_text = { { "", "LspDiagnosticsSignInformation" } },
      },
    },
  },
})
