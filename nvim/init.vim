"--------------------------
"  plugins
" --------------------------
call plug#begin('~/.vim/plugged')

Plug 'hashivim/vim-terraform'
let g:terraform_align=1
let g:terraform_fmt_on_save=1

Plug 'edkolev/tmuxline.vim'
Plug 'towolf/vim-helm'

call plug#end()

" config for Lua plugins
source ~/.config/nvim/lua/plugins/init.lua
source ~/.config/nvim/lua/plugins/nvim-tree.lua
source ~/.config/nvim/lua/plugins/nvim-cmp.lua
source ~/.config/nvim/lua/plugins/lualine.lua
source ~/.config/nvim/lua/lsps/init.lua

" --------------------------
" general settings
" --------------------------
set autoindent " copies indentation from previous line
set autowrite " automatically writes the file when switching buffers
set backspace=indent,eol,start " allows backspacing over everything
set clipboard=unnamedplus " unnamedplus makes yanking work with system-wide clipboard
"set cursorcolumn " highlights the current column
set cursorline " highlights the current line
set encoding=utf-8 " sets the encoding to utf-8
set expandtab " converts tabs to spaces
set fileencoding=utf-8 " sets the file encoding to utf-8
set fileformat=unix " sets the file format to unix
set hidden " allows switching between buffers without saving
set hlsearch " highlights search results
set incsearch " highlights search results as you type
set laststatus=2 " always show status line
set listchars=trail:· " shows trailing whitespace as a dot
set nobackup " avoids creating backup files
set noerrorbells " avoids making a sound on errored commands
set nolist " avoids showing listchars
set noswapfile " avoids creating a swap file, which is annoying when creating new file (buffers)
set nowrap " disables line wrapping
set number " shows line numbers
set norelativenumber " shows relative line numbers
set scrolloff=7 " keeps 7 lines above and below the cursor
set shiftwidth=4 " sets the number of spaces inserted for indentation
set smartcase " makes searches case-insensitive
set splitbelow " opens new windows below the current window
set splitright " opens new windows to the right of the current window
set tabstop=4 softtabstop=4 " sets the number of spaces inserted for indentation
set title " sets the title of the terminal window
set undodir=~/.vim/undodir " sets the undo directory
set undofile " enables undo file

scriptencoding utf-8
syntax enable  " enables syntax highlighting
"highlight NvimTreeFolderIcon guibg=blue

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
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>ff :NvimTreeFindFile<CR>
xnoremap <leader>b !bash<CR>

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-s> <cmd>Telescope live_grep<CR>
nnoremap <C-b> ^
nnoremap <S-b> $

nnoremap <F5> :buffers<CR>:buffer<Space>

map gf :tabnew <cfile><CR>

tnoremap <Esc> <C-\><C-n><CR>

" --------------------------
" autocmd groupings
" --------------------------
"augroup lua_plugins
"  autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
"augroup END

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

augroup miscellaneous " miscellaneous autocmds
  autocmd BufWritePre * :%s/\s\+$//e " removes trailing whitespace on save
augroup END


" --------------------------
" other
" --------------------------
colorscheme gruvbox
set background=dark

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
