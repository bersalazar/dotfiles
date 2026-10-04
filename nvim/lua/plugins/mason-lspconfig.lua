-- Guarantees every server in plugins/lspconfig.lua is installed.
-- Names are mason packages (not lspconfig names). Servers are enabled
-- explicitly over there, so automatic_enable stays off: leftover mason
-- packages must never start on their own.
return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  dependencies = { "mason-org/mason.nvim" },
  opts = {
    ensure_installed = {
      "bash-language-server",
      "dockerfile-language-server",
      "eslint-lsp",
      "gopls",
      "html-lsp",
      "json-lsp",
      "pyright",
      "ruff",
      "yaml-language-server",
    },
    automatic_enable = false,
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)
  end,
}
