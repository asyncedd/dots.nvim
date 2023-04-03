local spinner = {
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
}

return function()
  require("fidget").setup({
    text = {
      spinner = spinner,
    },
    timer = {
      spinner_rate = 250,
    },
  })
end
