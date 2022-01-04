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
" keymaps
" --------------------------
:let mapleader = ' '

command WL :set wrap linebreak
command FormatJson :%!jq .
command SourceVimrc :source ~/.config/nvim/init.vim
command HorizontalTerminalSplit :split term://zsh
command VerticalTerminalSplit :vsplit term://zsh
command Mdp :MarkdownPreview

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> gb :e#<CR>

nnoremap <leader>v :VerticalTerminalSplit<CR>
nnoremap <leader>t :HorizontalTerminalSplit<CR>
nnoremap <leader>so :SourceVimrc<CR>
nnoremap <leader>n :ALENextWrap<CR>
nnoremap <leader>man <cmd>Telescope man_pages<CR>
nnoremap <leader>gs <cmd>Telescope git_status<CR>
nnoremap <leader>b ^
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <leader>fn :FloatermNew<CR>
nnoremap <leader>fk :FloatermKill<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-s> <cmd>Telescope live_grep<CR>
nnoremap <C-\> <cmd>b#<CR>
nnoremap <C-j> :FloatermToggle<CR>
nnoremap <S-F8> <ESC>:set hls! hls?<cr>
inoremap <S-F8> <C-o>:set hls! hls?<cr>
vnoremap <S-F8> <ESC>:set hls! hls?<cr> <bar> gv

nnoremap <F5> :buffers<CR>:buffer<Space>

map gf :edit <cfile><CR>

" terminal mode
tnoremap <Esc> <C-\><C-n><CR>
"tnoremap <C-j> <C-\><C-n>:FloatermToggle<CR>
"tnoremap <C-k> <C-\><C-n>:FloatermKill<CR>
"tnoremap <C-l> <C-\><C-n>:FloatermNext<CR>
"tnoremap <C-h> <C-\><C-n>:FloatermPrev<CR>
"tnoremap <C-n> <C-\><C-n>:FloatermNew<CR>

" --------------------------
"  plugins
" --------------------------
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'morhetz/gruvbox'
Plug 'voldikss/vim-floaterm'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hashivim/vim-terraform'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/ale.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/vim-terraform.vim

call plug#end()

for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
    exe 'source' f
endfor

" --------------------------
" groupings
" --------------------------
augroup python " autocmd is used for changing tabstop values for python files
  autocmd python Filetype py setlocal tabstop=4
  autocmd python Filetype py setlocal softtabstop=4
augroup END

augroup ftgroovy " interpret Jenkinsfile as groovy syntax
  autocmd!
  autocmd BufRead,BufNewFile *.Jenkinsfile set filetype=groovy
  autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
augroup END

" --------------------------
" other
" --------------------------
colorscheme gruvbox
let g:airline_theme = 'gruvbox'
set background=dark
