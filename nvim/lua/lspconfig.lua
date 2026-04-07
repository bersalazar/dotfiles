local servers = {
  html = {},
  bashls = {},
  dockerls = {},
  eslint = {},
  gopls = {
    completeUnimported = true,
    staticcheck = true,
    usePlaceholders = true,
  },
  jsonls = {},
  pylsp = {},
  pyright = {},
}

for server, server_opts in pairs(servers) do
  vim.lsp.config(server, server_opts)
end

vim.lsp.enable(vim.tbl_keys(servers))
