require "nvchad.options"

local o = vim.o

o.autoindent = true -- copies indentation from previous line
o.autowrite = true -- automatically writes the file when switching buffers
o.clipboard = "unnamedplus" -- unnamedplus makes yanking work with system-wide clipboard
o.cursorlineopt = "both"
o.cursorline = true -- highlights the current line
o.encoding = "utf-8" -- sets the encoding to utf-8
o.expandtab = true -- converts tabs to spaces
o.fileencoding = "utf-8" -- sets the file encoding to utf-8
o.fileformat = "unix" -- sets the file format to unix
o.hidden = true -- allows switching between buffers without saving
o.hlsearch = true -- highlights search results
o.incsearch = true -- highlights search results as you type
o.laststatus = 2 -- always show status line
o.listchars = "trail:·" -- shows trailing whitespace as a dot
o.scrolloff = 7 -- keeps 7 lines above and below the cursor
o.shiftwidth = 2 -- sets the number of spaces inserted for indentation
o.smartcase = true -- makes searches case-insensitive
o.softtabstop = 2 -- sets the number of spaces inserted for indentation
o.splitbelow = true -- opens new windows below the current window
o.splitright = true -- opens new windows to the right of the current window
o.tabstop = 2 -- sets the number of spaces inserted for indentation
o.title = true -- sets the title of the terminal window
o.undodir = os.getenv("HOME") .. "/.config/nvim/undodir" -- set the undo directory location
o.undofile = true -- enables undo file
o.wrap = false -- disables line wrapping

-- Use vim.opt to set options that require a table
vim.opt.backspace = { "indent", "eol", "start" } -- allows backspacing over everything

-- Global options
local g = vim.g
g.copilot_enabled = 1
g.copilot_node_command = "/home/linuxbrew/.linuxbrew/bin/node"
g.copilot_no_tab_map = true

-- Filetypes
vim.filetype.add(
  {
  extension = {
    gotmpl = 'gotmpl',
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})
