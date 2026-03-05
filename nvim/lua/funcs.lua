local M = {}

-- constants
local view_width_max = -1

-- open nvim-tree when opening a directory or a buffer
function M.open_nvim_tree(data)

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

-- toggle the nvim-tree width and redraw
function M.toggle_width_adaptive()
  if view_width_max == -1 then
    view_width_max = 30
  else
    view_width_max = -1
  end

  require("nvim-tree.api").tree.reload()
end

-- get current nvim-tree view width
function M.get_view_width_max()
  return view_width_max
end

-- toggle copilot on and off
function M.toggle_copilot()
    if vim.g.copilot_enabled == 1 then
        vim.g.copilot_enabled = 0
    else
        vim.g.copilot_enabled = 1
    end
end

function M.restore_cursor_position()
  local line = vim.fn.line "'\""
  if
    line > 1
    and line <= vim.fn.line "$"
    and vim.bo.filetype ~= "commit"
    and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
  then
    vim.cmd 'normal! g`"'
  end
end

return M
