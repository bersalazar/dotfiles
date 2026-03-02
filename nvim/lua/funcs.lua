local M = {}

-- constants
local view_width_max = -1

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

return M
