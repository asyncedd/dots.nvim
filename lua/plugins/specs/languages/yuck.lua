return dots.languages.yuck ~= true and {} or {
  {
    "elkowar/yuck.vim",
    event = "BufRead *.yuck",
  },
}
