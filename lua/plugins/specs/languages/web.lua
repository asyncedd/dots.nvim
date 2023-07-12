return dots.languages.web ~= true and {}
  or {
    {
      "nvim-neotest/neotest",
      opts = function()
        return {
          adapters = {
            require("neotest-vitest"),
            require("neotest-playwright").adapter({
              options = {
                persist_project_selection = true,
                enable_dynamic_test_discovery = true,
              },
            }),
          },
        }
      end,
      dependencies = {
        "marilari88/neotest-vitest",
        "thenbe/neotest-playwright",
      },
    },
  }
