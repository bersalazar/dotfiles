local servers = {
  html = {},
  bashls = {},
  dockerls = {},
  eslint = {},
  gopls = {
    settings = {
      completeUnimported = true,
      staticcheck = true,
      usePlaceholders = true,
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
}

for server, server_opts in pairs(servers) do
  vim.lsp.config(server, server_opts)
end

vim.lsp.enable(vim.tbl_keys(servers))
