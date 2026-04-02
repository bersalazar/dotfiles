return {
  "neovim/nvim-lspconfig",
  lazy = false,
  opts = {
    servers = {
      html = {},
      bashls = {},
      dockerls = {},
      eslint = {},
      gopls = {
        settings = {
          gopls = {
            completeUnimported = true,
            staticcheck = true,
            usePlaceholders = true,
          }
        }
      },
      jsonls = {},
      pylsp = {},
      pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              typeCheckingMode = "basic",
            },
          },
        },
      },
      tflint = {},
      ts_ls = {},
      yamlls = {
        format = {
          enable = true,
          validate = false,
        },
        cmd = { "yaml-language-server", "--stdio" },
      },
    },
  },
}
