local coroutine = coroutine

-- Define a function to resume the coroutine until it completes
local function resumeCoroutine(co)
  if coroutine.status(co) ~= "dead" then
    coroutine.resume(co)
  end
end

resumeCoroutine(coroutine.create(function()
  require("nvim-treesitter.configs").setup({

    -- Make sure we've installed:
    ensure_installed = { "markdown", "markdown_inline" },

    -- Auto-install mssing parsers
    auto_install = true,

    -- Enable highlighting.
    highlight = {
      enable = true,
      use_languagetree = true,
    },
  })
end))

