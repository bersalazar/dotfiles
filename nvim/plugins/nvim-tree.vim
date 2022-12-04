scriptencoding utf-8

nnoremap <C-n>  =NvimTreeFindFileToggle<CR>
nnoremap <leader>r  =NvimTreeRefresh<CR>
nnoremap <leader>n  =NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at ` =help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua <<EOF
  local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  local list = {
    { key = {"o"},        cb = tree_cb("edit") },
    { key = {"<CR>"},     cb = tree_cb("cd") },
    { key = "s",          cb = tree_cb("vsplit") },
    { key = "i",          cb = tree_cb("split") },
    { key = "t",          cb = tree_cb("tabnew") },
    { key = "<",          cb = tree_cb("prev_sibling") },
    { key = ">",          cb = tree_cb("next_sibling") },
    { key = "P",          cb = tree_cb("parent_node") },
    { key = "<BS>",       cb = tree_cb("close_node") },
    { key = "<S-CR>",     cb = tree_cb("close_node") },
    { key = "<Tab>",      cb = tree_cb("preview") },
    { key = "K",          cb = tree_cb("first_sibling") },
    { key = "J",          cb = tree_cb("last_sibling") },
    { key = "I",          cb = tree_cb("toggle_ignored") },
    { key = "H",          cb = tree_cb("toggle_dotfiles") },
    { key = "R",          cb = tree_cb("refresh") },
    { key = "a",          cb = tree_cb("create") },
    { key = "d",          cb = tree_cb("remove") },
    { key = "r",          cb = tree_cb("rename") },
    { key = "<C-r>",      cb = tree_cb("full_rename") },
    { key = "x",          cb = tree_cb("cut") },
    { key = "c",          cb = tree_cb("copy") },
    { key = "p",          cb = tree_cb("paste") },
    { key = "y",          cb = tree_cb("copy_name") },
    { key = "Y",          cb = tree_cb("copy_path") },
    { key = "gy",         cb = tree_cb("copy_absolute_path") },
    { key = "[c",         cb = tree_cb("prev_git_item") },
    { key = "]c",         cb = tree_cb("next_git_item") },
    { key = "-",          cb = tree_cb("dir_up") },
    { key = "q",          cb = tree_cb("close") },
    { key = "g?",         cb = tree_cb("toggle_help") },
  }

  require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = ">",
        info = "[",
        warning = "!",
        error = "*",
      }
    },
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    view = {
      width = 30,
      hide_root_folder = false,
      side = 'left',
      mappings = {
        custom_only = false,
        list = list
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes"
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false
        },
        resize_window = true
      }
    },
    renderer = {
      indent_markers = {
        enable = true
      },
      add_trailing = true,
      highlight_opened_files = 'icon',
      root_folder_modifier = ' =~',
      highlight_git = true,
      icons = {
        show = {
          file = false,
          folder = false,
          git = true
        },
        glyphs = {
          default = '',
          symlink = '',
          git = {
            unstaged = '✗',
            staged = '✓',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '',
            ignored = '◌'
          },
          folder = {
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
          }
        }
      }
    }
  }
EOF
