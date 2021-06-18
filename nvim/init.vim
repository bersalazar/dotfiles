set encoding=utf-8 " encoding	shows how vim shall represent characters internally
set fileencoding=utf-8
scriptencoding utf-8

syntax enable  " enables syntax highlighting
set number " display line numbers
set noswapfile " avoids creating a swap file, which is annoying when creating new file (buffers)
set noerrorbells " avoids making a sound on errored commands
set nowrap " avoids line wraping
set smartcase
set nobackup
set undodir=~/.vim/undodir " sets the undo directory
set undofile " enables undo file
set incsearch
set splitright " vertical split is done to the right
set splitbelow " horizontal split is done below

set scrolloff=7
set backspace=indent,eol,start
set smartindent
set autoindent
set fileformat=unix

" Tab key configuration
set tabstop=2 softtabstop=2
set shiftwidth=2
set noexpandtab

" autocmd is used for changing tabstop values for python files
augroup python
	autocmd python Filetype py setlocal tabstop=4
	autocmd python Filetype py setlocal softtabstop=4
augroup END

" Interpret Jenkinsfile as groovy syntax
augroup ftgroovy
	autocmd!
	autocmd BufRead,BufNewFile *.Jenkinsfile set filetype=groovy
	autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
augroup END

" plugins
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'hashivim/vim-terraform'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" load plugins configurations
for f in split(glob('~/.config/nvim/plugins.d/*.vim'), '\n')
    exe 'source' f
endfor

" theme
colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark

" terraform plugin
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" ALE Linter and fixer
let g:airline#extensions#ale#enabled = 1
let g:ale_disable_lsp = 1
let b:ale_fixers = {
            \'python': ['autopep8']
            \}
let g:ale_linters = {
            \'python': ['flake8'],
            \'markdown': ['markdownlint', 'writegood'],
            \'shell': ['shellcheck'],
            \}
let g:ale_python_flake8_options = '--max-line-length=250'

" coc.nvim (code completion plugin)
let g:coc_global_extensions = ['coc-json', 'coc-yaml']
" use coc status in the status line
set statusline^=%{coc#status()}
" use <CR> to confirm autocomplete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~? '\s'
endfunction
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()

" coc.nvim goto code navigation remaps
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gb :e#<CR>

" Custom Commands
command HorizontalTerminalSplit :split term://zsh         "terminal mode horizontal split
command VerticalTerminalSplit :vsplit term://zsh        "terminal mode vertical split
command WL :set wrap linebreak
command FormatJson :%!jq .

" key remaps
:let mapleader = ' '
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>c :w !pbcopy<CR>
map <leader>v :VerticalTerminalSplit<CR>
map <leader>t :HorizontalTerminalSplit<CR>
map <leader>n :ALENextWrap<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>
nmap <leader>b <C-6><CR>
" I want a shortcut for Ctrl+^ to go to first char of a line. This doesn't work:
" nmap <C-\> <S-^>

" Find files using Telescope command-line sugar.
nnoremap <C-s> <cmd>Telescope live_grep<CR>
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-x> <cmd>Telescope file_browser<CR>

"nnoremap <leader>fb <cmd>Telescope buffers<CR>
"nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" Terminal mode remappings
tnoremap <Esc> <C-\><C-n>

