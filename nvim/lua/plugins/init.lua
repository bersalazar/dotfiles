return {
    {
      "stevearc/conform.nvim",
      -- event = 'BufWritePre', -- uncomment for format on save
      config = function()
        require "configs.conform"
      end,
    },
    {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
        require("nvchad.configs.lspconfig").defaults()
        require "configs.lspconfig"
      end,
    },
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "gopls",
        },
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
    },
    {
      "github/copilot.vim",
      lazy = false
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
      ft = { "markdown" },
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
    },
    --{
    --  "mfussenegger/nvim-dap",
    --},
    --{
    --  "leoluz/nvim-dap-go",
    --  dependencies = "mfussenegger/nvim-dap",
    --  opts = {
    --    dap_configurations = {
    --      {
    --        -- Must be "go" or it will be ignored by the plugin
    --        type = "go",
    --        name = "Attach remote",
    --        mode = "remote",
    --        request = "attach",
    --      },
    --    },
    --  },
    --},
    --{
    --  "olexsmir/gopher.nvim",
    --  ft = "go",
    --  config = function(_, opts)
    --    require("gopher").setup(opts)
    --  end,
    --  build = function()
    --    vim.cmd [[silent! GoInstallDeps]]
    --  end,
    --},
}
