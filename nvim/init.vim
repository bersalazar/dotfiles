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
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" nvim-tree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
"
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" load plugins configurations from plugins.d
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

" ALE/coc.nvim (linter/fixer/code completion)
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
let g:coc_global_extensions = ['coc-json', 'coc-yaml']
"
" use coc status in the status line
set statusline^=%{coc#status()}

" use <CR> to confirm autocomplete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" use <tab> to trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~? '\s'
endfunction
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()

command HorizontalTerminalSplit :split term://zsh         "terminal mode horizontal split
command VerticalTerminalSplit :vsplit term://zsh        "terminal mode vertical split
command WL :set wrap linebreak
command FormatJson :%!jq .

:let mapleader = ' '
" coc.nvim goto code navigation remaps
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> gb :e#<CR>

nnoremap <leader>c :w !pbcopy<CR>
nnoremap <leader>v :VerticalTerminalSplit<CR>
nnoremap <leader>t :HorizontalTerminalSplit<CR>
nnoremap <leader>n :ALENextWrap<CR>
nnoremap <leader>gg <cmd>Telescope live_grep<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fb <cmd>Telescope file_browser<CR>
nnoremap <leader>man <cmd>Telescope man_pages<CR>
nnoremap <leader>b ^

" movement key remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>

" terminal mode remappings
tnoremap <Esc> <C-\><C-n>
