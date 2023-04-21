require("cutlass").setup({
  exclude = { "ns", "nS" },
  cut_key = "m",
  registers = {
    select = "s",
    delete = "d",
    change = "c",
  },
})
