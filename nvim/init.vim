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
" For file icons
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" NVIM tree
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
"let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': '✗',
    \   'staged': '✓',
    \   'unmerged': '',
    \   'renamed': '➜',
    \   'untracked': '★',
    \   'deleted': '',
    \   'ignored': '◌'
    \   },
    \ 'folder': {
    \   'default': '',
    \   'open': '',
    \   'empty': '',
    \   'empty_open': '',
    \   'symlink': '',
    \   'symlink_open': '',
    \   },
    \   'lsp': {
    \     'hint': '',
    \     'info': '',
    \     'warning': '',
    \     'error': '',
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

let nvim_tree_disable_key_bindings=1

lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      ["<CR>"]           = tree_cb("edit"),
      ["o"]              = tree_cb("edit"),
      ["<2-LeftMouse>"]  = tree_cb("edit"),
      ["<2-RightMouse>"] = tree_cb("cd"),
      ["<C-]>"]          = tree_cb("cd"),
      ["s"]          = tree_cb("vsplit"),
      ["i"]          = tree_cb("split"),
      ["t"]          = tree_cb("tabnew"),
      ["<"]              = tree_cb("prev_sibling"),
      [">"]              = tree_cb("next_sibling"),
      ["<BS>"]           = tree_cb("close_node"),
      ["<S-CR>"]         = tree_cb("close_node"),
      ["<Tab>"]          = tree_cb("preview"),
      ["I"]              = tree_cb("toggle_ignored"),
      ["H"]              = tree_cb("toggle_dotfiles"),
      ["R"]              = tree_cb("refresh"),
      ["a"]              = tree_cb("create"),
      ["d"]              = tree_cb("remove"),
      ["r"]              = tree_cb("rename"),
      ["<C-r>"]          = tree_cb("full_rename"),
      ["x"]              = tree_cb("cut"),
      ["c"]              = tree_cb("copy"),
      ["p"]              = tree_cb("paste"),
      ["y"]              = tree_cb("copy_name"),
      ["Y"]              = tree_cb("copy_path"),
      ["gy"]             = tree_cb("copy_absolute_path"),
      ["[c"]             = tree_cb("prev_git_item"),
      ["]c"]             = tree_cb("next_git_item"),
      ["-"]              = tree_cb("dir_up"),
      ["q"]              = tree_cb("close"),
    }
EOF

" TODO: Move all of the nvim tree block to a separate file and import it here
" END NVIM TREE

colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark

" Terraform plugin
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

" Interpret Jenkinsfile as groovy syntax
autocmd BufRead,BufNewFile *.Jenkinsfile set filetype=groovy
autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
