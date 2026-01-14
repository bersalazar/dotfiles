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
      lazy = false,
      init = function()
        vim.g.copilot_filetypes = {
          ["*"] = true,
          markdown = false,
        }
      end,
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
    {
      "nvim-java/nvim-java",
      config = function()
        require('java').setup()
        vim.lsp.enable('jdtls')
      end,
    },
    {
      "tpope/vim-fugitive",
    },
    {
      "hrsh7th/nvim-cmp",
      config = function()
        local cmp = require("cmp")

        -- Disable nvim-cmp in markdown files
        cmp.setup.filetype("markdown", {
          enabled = false,
        })
      end,
    }
    -- {
    --   "mfussenegger/nvim-jdtls",
    -- },
}
