return dots.filetypes.web ~= true and {}
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
      "ziontee113/deliberate.nvim",
      dependencies = {
        "anuvyklack/hydra.nvim",
      },
      config = function()
        local supported_filetypes = { "typescriptreact", "svelte" }
        local augroup = vim.api.nvim_create_augroup("DeliberateEntryPoint", { clear = true })
        vim.api.nvim_create_autocmd({ "FileType" }, {
          pattern = supported_filetypes,
          group = augroup,
          callback = function()
            local bufnr = vim.api.nvim_get_current_buf()
            if vim.tbl_contains(supported_filetypes, vim.bo.ft) then
              vim.keymap.set("n", "<Esc>", function()
                vim.api.nvim_input("<Plug>DeliberateHydraEsc")
              end, { buffer = bufnr })
              vim.keymap.set("i", "<Plug>DeliberateHydraEsc", "<Nop>", {})
            end
          end,
        })

        require("deliberate.hydra")
      end,
      event = "VeryLazy",
    },
  }
