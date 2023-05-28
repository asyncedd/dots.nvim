return function(opts)
  if opts.enable == true then
    require("nvim-treesitter.configs").setup({
      autotag = {
        enable = true,
      },
    })
  else
    return false
  end
end
