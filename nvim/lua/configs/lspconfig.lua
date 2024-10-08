local configs = require("nvchad.configs.lspconfig")

local servers = {
  html = {},
  bashls = {},
  dockerls = {},
  eslint = {},
  gopls = {
    settings = {
      gopls = {
        completeUnimported = true,
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
  terraform_lsp = {},
  tflint = {},
  ts_ls = {},
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
