-- Guarantees every server in plugins/lspconfig.lua is installed.
-- Names are lspconfig server names, matching the keys in plugins/lspconfig.lua.
-- Servers are enabled explicitly over there, so automatic_enable stays off:
-- leftover mason packages must never start on their own.
return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  dependencies = { "mason-org/mason.nvim" },
  opts = {
    ensure_installed = {
      "bashls",
      "dockerls",
      "eslint",
      "gopls",
      "html",
      "jsonls",
      "pyright",
      "ruff",
      "yamlls",
    },
    automatic_enable = false,
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)
  end,
}
