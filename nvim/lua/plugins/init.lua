-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

-- packer
local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- packer self-managed

    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }

    use 'ellisonleao/gruvbox.nvim' -- gruvbox theme for neovim
    use 'jose-elias-alvarez/null-ls.nvim' -- enables some linters like eslint
    use 'MunifTanjim/eslint.nvim' -- eslint plugin for neovim's LSP client
    use 'tpope/vim-fugitive'
    use 'mfussenegger/nvim-jdtls'

    -- nvim-tree (file browser)
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }

    -- lualine (vim status bar)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- telescope (file and fuzzy search)
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {
              'nvim-lua/plenary.nvim'
            },
            {
              'nvim-telescope/telescope-fzf-native.nvim',
              run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            }
        }
    }

    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn["mkdp#util#install"]() end,
    }
end)

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
