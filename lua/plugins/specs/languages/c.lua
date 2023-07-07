return not _G.config.filetypes.c == true and {}
  or {
    {
      "p00f/clangd_extensions.nvim",
      opts = {
        server = {
          -- Ensure mason installs the server
          clangd = {
            keys = {
              { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
            },
            root_dir = function(...)
              -- using a root .clang-format or .clang-tidy file messes up projects, so remove them
              return require("lspconfig.util").root_pattern(
                "compile_commands.json",
                "compile_flags.txt",
                "configure.ac",
                ".git"
              )(...)
            end,
            capabilities = {
              offsetEncoding = { "utf-16" },
            },
            cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--header-insertion=iwyu",
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=llvm",
            },
            init_options = {
              usePlaceholders = true,
              completeUnimported = true,
              clangdFileStatus = true,
            },
          },
        },
        extensions = {
          inlay_hints = {
            inline = false,
          },
          ast = {
            --These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
              type = "",
              declaration = "",
              expression = "",
              specifier = "",
              statement = "",
              ["template argument"] = "",
            },
            kind_icons = {
              Compound = "",
              Recovery = "",
              TranslationUnit = "",
              PackExpansion = "",
              TemplateTypeParm = "",
              TemplateTemplateParm = "",
              TemplateParamObject = "",
            },
          },
        },
      },
    },
  }
