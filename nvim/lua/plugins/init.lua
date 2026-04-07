return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      --require("configs.lspconfig")
    end,
  },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  -- },
  -- {
  --   "nvim-neotest/nvim-nio",
  -- },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
}
