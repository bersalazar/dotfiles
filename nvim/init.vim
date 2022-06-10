" --------------------------
"  plugins
" --------------------------
call plug#begin('~/.vim/plugged')

"Plug 'github/copilot.vim'
Plug 'morhetz/gruvbox'
Plug 'wittyjudge/gruvbox-material.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hashivim/vim-terraform'
Plug 'nvim-treesitter/nvim-treesitter'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'

call plug#end()

" Extra plugins are installed in here
source ~/.config/nvim/lua/init.lua
source ~/.config/nvim/lua/plugins.lua

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/vim-terraform.vim

" --------------------------
" general settings
" --------------------------
set expandtab
set shiftwidth=2
set tabstop=4 softtabstop=4
set encoding=utf-8
set fileencoding=utf-8
set number
set relativenumber
set noswapfile " avoids creating a swap file, which is annoying when creating new file (buffers)
set noerrorbells " avoids making a sound on errored commands
set hidden
set title
set list
set listchars=trail:·
set nowrap
set smartcase " makes searches case-insensitive
set smartindent
set autoindent
set nobackup
set undodir=~/.vim/undodir " sets the undo directory
set undofile " enables undo file
set incsearch
set splitright
set splitbelow
set scrolloff=7
set backspace=indent,eol,start
set fileformat=unix
set clipboard=unnamed

scriptencoding utf-8
syntax enable  " enables syntax highlighting

" --------------------------
" commands
" --------------------------
command WL :set wrap linebreak
command FormatJson :%!jq .
command SourceVimrc :source ~/.config/nvim/init.vim
command HorizontalTerminalSplit :split term://zsh
command VerticalTerminalSplit :vsplit term://zsh
command TerminalInNewTab :tabnew term://zsh
command Mdp :MarkdownPreview
command ReloadCurrentFile :e
command RnuToggle :set rnu!

" --------------------------
" keymaps
" --------------------------
:let mapleader = ' '

nnoremap <silent> gb :e#<CR>

nnoremap <leader>v :VerticalTerminalSplit<CR>
nnoremap <leader>t :HorizontalTerminalSplit<CR>
nnoremap <leader>so :SourceVimrc<CR>
nnoremap <leader>man <cmd>Telescope man_pages<CR>
nnoremap <leader>gs <cmd>Telescope git_status<CR>
nnoremap <leader>b ^
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>rnu :RnuToggle<CR>

nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-s> <cmd>Telescope live_grep<CR>
nnoremap <C-\> <cmd>b#<CR>
nnoremap <C-j> :FloatermToggle<CR>
nnoremap <C-F8> :noh<CR>
inoremap <C-F8> :noh<CR>

nnoremap <F5> :buffers<CR>:buffer<Space>

map gf :tabnew <cfile><CR>

tnoremap <Esc> <C-\><C-n><CR>


" --------------------------
" autocmd groupings
" --------------------------
augroup notion
  autocmd BufNewFile,BufRead ~/sync/notion/* :Goyo<CR>
augroup END

augroup python " autocmd is used for changing tabstop values for python files
  autocmd python Filetype py setlocal tabstop=4
  autocmd python Filetype py setlocal softtabstop=4
augroup END

"augroup typescript " autocmd is used for changing tabstop values for typescript files
"  autocmd typescript Filetype ts setlocal tabstop=4
"  autocmd typescript Filetype ts setlocal softtabstop=4
"augroup END

augroup ftgroovy " interpret Jenkinsfile as groovy syntax
  autocmd!
  autocmd BufRead,BufNewFile *.Jenkinsfile set filetype=groovy
  autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
augroup END

" --------------------------
" other
" --------------------------
let g:airline_theme = 'base16_gruvbox_dark_medium'
colorscheme gruvbox-material
set background=dark
