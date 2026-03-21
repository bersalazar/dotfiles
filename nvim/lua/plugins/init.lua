return {
    {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
        require("nvchad.configs.lspconfig").defaults()
        require("configs.lspconfig")
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
        require("configs.telescope")
      end,
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
    },
    {
      "nvim-tree/nvim-tree.lua",
      config = function()
        require("configs.nvim-tree")
      end,
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
     "mfussenegger/nvim-dap-python",
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
          layout = 'vertical', -- 'horizontal', float, 'vertical'
          width = 100, -- Fixed width in columns
          height = 10, -- Fixed height in rows
        },

        headers = {
          user = 'Bernardo',
          assistant = 'Copilot',
          tool = 'Tool',
        },

        separator = '━━',
        auto_fold = true, -- Automatically folds non-assistant messages
        auto_insert_mode = false,     -- Enter insert mode when opening
        auto_follow_cursor = true,     -- Automatically follow the cursor
        insert_at_end = true,

        mappings = {
          close = {
            normal = "<C-c>",
            insert = "<C-c>",
          },
          submit_prompt = {
            normal = "<A-Enter>",
            insert = "<A-Enter>",
          },
        },
      },
    },
}
