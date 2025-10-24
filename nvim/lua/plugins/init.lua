return {
    {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
        require("nvchad.configs.lspconfig").defaults()
        require "configs.lspconfig"
      end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
    },
    {
      "github/copilot.vim",
      lazy = false
    },
    {
      "nvim-telescope/telescope.nvim",
      config = function()
        require "configs.telescope"
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      opts = {
        actions = {
          open_file = {
            window_picker = {
              enable = false
            }
          }
        }
      }
    },
    {
      "iamcco/markdown-preview.nvim",
      lazy = false,
      ft = { "markdown" },
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
    },
    {
     "mfussenegger/nvim-dap",
    },
    {
     "leoluz/nvim-dap-go",
    },
    {
      "nvim-neotest/nvim-nio",
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
      }
    },
}
