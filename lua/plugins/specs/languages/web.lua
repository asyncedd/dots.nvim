return (not dots.languages.web or dots.languages.svelte ~= true or dots.languages.typescript ~= true) and {}
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
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          emmet_language_server = dots.languages.web.emmet == "olrtg" and {} or nil,
          emmet_ls = dots.languages.web.emmet == "aca" and {} or nil,
        },
      },
    },
  }
