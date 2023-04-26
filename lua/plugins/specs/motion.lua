return {
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion(\"w\")<CR>" },
      { "e", "<cmd>lua require('spider').motion(\"e\")<CR>" },
      { "b", "<cmd>lua require('spider').motion(\"b\")<CR>" },
      { "ge", "<cmd>lua require('spider').motion(\"ge\")<CR>" },
    },
  },
}
