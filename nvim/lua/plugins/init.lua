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
      lazy = false,
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
    },
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      lazy = false,
      dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
      },
      build = "make tiktoken",
      opts = {
        model = "gpt-4o",          -- Model to use
        temperature = 0.1,           -- Lower = focused, higher = creative
        window = {
          layout = 'vertical',       -- 'vertical', 'horizontal', 'float'
          width = 0.5,              -- 50% of screen width
        },
        auto_insert_mode = true,     -- Enter insert mode when opening
      },
    },
    -- {
    --   "mfussenegger/nvim-jdtls",
    -- },
}
