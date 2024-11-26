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
      "wallpants/github-preview.nvim",
      cmd = { "GithubPreviewToggle" },
      keys = { "<leader>mpt" },
      opts = {},
      config = function(_, opts)
          local gpreview = require("github-preview")
          gpreview.setup(opts)

          local fns = gpreview.fns
          vim.keymap.set("n", "<leader>mpt", fns.toggle)
          vim.keymap.set("n", "<leader>mps", fns.single_file_toggle)
          vim.keymap.set("n", "<leader>mpd", fns.details_tags_toggle)
      end,
    },
    -- {
    --   "iamcco/markdown-preview.nvim",
    --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --   ft = { "markdown" },
    --   build = function() vim.fn["mkdp#util#install"]() end,
    -- },
    -- {
    --   "iamcco/markdown-preview.nvim",
    --   lazy = false,
    --   ft = { "markdown" },
    --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --   build = "cd app && yarn install",
    --   init = function()
    --     vim.g.mkdp_filetypes = { "markdown" }
    --   end,
    -- },
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = {"nvim-lua/plenary.nvim"},
      config = function()
        require("nvchad.configs.harpoon").defaults()
      end,
    },
    {
      "kdheepak/lazygit.nvim",
      lazy = true,
      cmd = {
          "LazyGit",
          "LazyGitConfig",
          "LazyGitCurrentFile",
          "LazyGitFilter",
          "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
          "nvim-lua/plenary.nvim",
      },
      -- setting the keybinding for LazyGit with 'keys' is recommended in
      -- order to load the plugin when the command is run for the first time
      keys = {
          { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
      }
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
