syntax enable
set encoding=utf-8
set number relativenumber
set noswapfile
set noerrorbells
set nowrap
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set splitright "vertical split is done to the right
set splitbelow "horizontal split is done below

set scrolloff=7
set backspace=indent,eol,start 
" set smartindent
set autoindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark

"Conquer of Completion (coc)
set statusline^=%{coc#status()}
" use <CR> to confirm autocomplete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle

" Custom Commands
command HorizontalTerminalSplit :split term://zsh         "terminal mode horizontal split
command VerticalTerminalSplit :vsplit term://zsh        "terminal mode vertical split
command WL :set wrap linebreak

" Remaps
:let mapleader = " "
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>c :w !pbcopy<CR>
map <leader>v :VerticalTerminalSplit<CR>
map <leader>t :HorizontalTerminalSplit<CR>
nnoremap <leader>pt :NERDTreeToggle<CR>
nnoremap <silent> <leader>pv :NERDTreeFind<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-l> :Rg<CR>
nmap <C-\> <S-^>

" Terminal mode remappings
tnoremap <Esc> <C-\><C-n>
