return not dots.goodies.snippets ~= false and {}
  or {
    {
      "TobinPalmer/rayso.nvim",
      opts = true,
      init = function()
        vim.api.nvim_create_user_command("RaySo", function()
          require("lib.create").create_snippet()
        end, { desc = "Create a ray.so snippet" })
      end,
      enabled = dots.goodies.snippets.rayso,
    },
  }
