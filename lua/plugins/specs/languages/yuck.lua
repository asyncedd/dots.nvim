return dots.filetypes.yuck ~= true and {} or {
  {
    "elkowar/yuck.vim",
    event = "BufRead *.yuck",
  },
}
