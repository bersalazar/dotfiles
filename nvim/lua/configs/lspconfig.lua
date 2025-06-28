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
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
