-- Home for LSP setup: plugin spec plus the server table.
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    local servers = {
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
          },
        },
      },
      jsonls = {},
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pyflakes = {
                enabled = true,
              },
              pycodestyle = {
                enabled = false,
                maxLineLength = 200,
              },
            },
          },
        },
      },
      pyright = {},
      yamlls = {
        settings = {
          yaml = {
            validate = true,
            hover = true,
            completion = true,
            format = {
              enable = true,
            },
            schemaStore = {
              enable = false,
            },
            schemas = {},
          },
        },
      },
    }

    for server, server_opts in pairs(servers) do
      vim.lsp.config(server, server_opts)
    end

    vim.lsp.enable(vim.tbl_keys(servers))
  end,
}
