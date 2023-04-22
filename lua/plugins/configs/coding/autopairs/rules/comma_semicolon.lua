for _, punct in pairs({ ",", ";" }) do
  require("nvim-autopairs").add_rules({
    require("nvim-autopairs.rule")("", punct)
      :with_move(function(opts)
        return opts.char == punct
      end)
      :with_pair(function()
        return false
      end)
      :with_del(function()
        return false
      end)
      :with_cr(function()
        return false
      end)
      :use_key(punct),
  })
end
