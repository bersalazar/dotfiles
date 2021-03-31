syntax enable
set encoding=utf-8
set number
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
set tabstop=2 softtabstop=2
set shiftwidth=4
set expandtab
set fileformat=unix

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'

call plug#end()

colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark

" Terraform plugin
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Linter and fixer
let g:ale_disable_lsp = 1
let g:ale_linters = {
            \   'python': ['flake8', 'pycodestyle']
            \}
let g:ale_python_flake8_options = '--max-line-length=250'
let g:airline#extensions#ale#enabled = 1
 let b:ale_fixers = {
 \   '*': ['remove_trailing_lines', 'trim_whitespace'],
 \   'javascript': ['eslint'],
 \   'python': ['autopep8']
 \}
let g:ale_fix_on_save = 1

" Conquer of Completion (coc)
let g:coc_global_extensions = ['coc-json', 'coc-yaml']
set statusline^=%{coc#status()}
" use <CR> to confirm autocomplete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  " I changed =~ to =~? recently. Come back to this if the behavior changes
  " and gives problems
  "return !col || getline('.')[col - 1]  =~ '\s'
  return !col || getline('.')[col - 1]  =~? '\s'
endfunction
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let g:NERDTreeMinimalUI=1

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle

" Custom Commands
command HorizontalTerminalSplit :split term://zsh         "terminal mode horizontal split
command VerticalTerminalSplit :vsplit term://zsh        "terminal mode vertical split
command WL :set wrap linebreak

" Remaps
:let mapleader = ' '
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>c :w !pbcopy<CR>
map <leader>v :VerticalTerminalSplit<CR>
map <leader>t :HorizontalTerminalSplit<CR>
map <leader>n :ALENextWrap<CR>
nnoremap <leader>pt :NERDTreeToggle<CR>
nnoremap <silent> <leader>pv :NERDTreeFind<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-s> :Rg<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>
nmap <C-\> <S-^>
nmap <leader>b <C-6><CR>

" Terminal mode remappings
tnoremap <Esc> <C-\><C-n>
