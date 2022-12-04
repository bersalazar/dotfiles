" --------------------------
"  plugins
" --------------------------
call plug#begin('~/.vim/plugged')

"Plug 'github/copilot.vim'
Plug 'morhetz/gruvbox'
Plug 'wittyjudge/gruvbox-material.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hashivim/vim-terraform'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

call plug#end()

" config for VimScript plugins
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/vim-terraform.vim

" config for Lua plugins
source ~/.config/nvim/lua/init.lua
source ~/.config/nvim/lua/nvim-cmp.lua
source ~/.config/nvim/lua/plugins.lua

" --------------------------
" general settings
" --------------------------
"set autoindent
set laststatus=2
set backspace=indent,eol,start
set clipboard=unnamed
set cursorline
set cursorcolumn
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileformat=unix
set hidden
set incsearch
set nolist
set listchars=trail:·
set nobackup
set noerrorbells " avoids making a sound on errored commands
set noswapfile " avoids creating a swap file, which is annoying when creating new file (buffers)
set nowrap
set number
set relativenumber
set scrolloff=7
set shiftwidth=4
set smartcase " makes searches case-insensitive
set splitbelow
set splitright
set tabstop=4 softtabstop=4
set title
set undodir=~/.vim/undodir " sets the undo directory
set undofile " enables undo file

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
command RnuToggle :set rnu!
command RemoveWhitespace :%s/\s\+$//e

" --------------------------
" keymaps
" --------------------------
:let mapleader = ' '

nnoremap <silent> gb :e#<CR>

nnoremap <leader>v :VerticalTerminalSplit<CR>
nnoremap <leader>t :HorizontalTerminalSplit<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>rnu :RnuToggle<CR>
nnoremap <leader>man <cmd>Telescope man_pages<CR>
nnoremap <leader>gs <cmd>Telescope git_status<CR>
nnoremap <leader>src :SourceVimrc<CR>
nnoremap <leader>rw :RemoveWhitespace<CR>
nnoremap <leader>git :Git<CR>

nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-s> <cmd>Telescope live_grep<CR>
nnoremap <C-\> <cmd>b#<CR>
nnoremap <C-F8> :noh<CR>
inoremap <C-F8> :noh<CR>
nnoremap <C-b> ^
nnoremap <S-b> $

nnoremap <F5> :buffers<CR>:buffer<Space>

map gf :tabnew <cfile><CR>

tnoremap <Esc> <C-\><C-n><CR>

" -----------------------------
" lightline (vim's status line)
" -----------------------------
let g:lightline = {
  \ 'component_function': {
  \   'filename': 'AbsolutePathFilename',
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ 'colorscheme': 'gruvbox'
  \ }

function! AbsolutePathFilename() " show full path of filename in lighline's status line
  return expand('%')
endfunction

function! FugitiveHead() " show full path of filename in lighline's status line
  return expand('%')
endfunction

" --------------------------
" autocmd groupings
" --------------------------
augroup lua_plugins
  autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
augroup END

augroup python " autocmd is used for changing tabstop values for python files
  autocmd python Filetype py setlocal tabstop=4
  autocmd python Filetype py setlocal softtabstop=4
augroup END

augroup typescript " autocmd is used for changing tabstop values for typescript files
  autocmd typescript Filetype ts setlocal tabstop=4
  autocmd typescript Filetype ts setlocal softtabstop=4
augroup END

augroup ftgroovy " interpret Jenkinsfile as groovy syntax
  autocmd!
  autocmd BufRead,BufNewFile *.Jenkinsfile set filetype=groovy
  autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
augroup END

" --------------------------
" other
" --------------------------
colorscheme gruvbox-material
set background=dark

