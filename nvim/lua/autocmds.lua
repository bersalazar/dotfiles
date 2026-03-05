local funcs = require("funcs")
local autocmd = vim.api.nvim_create_autocmd

-- open nvim-tree automatically when opening a directory
autocmd("VimEnter",
  {
    callback = funcs.open_nvim_tree,
  }
)

-- restore the cursor position when opening a file
autocmd("BufReadPost", {
  pattern = "*",
  callback = funcs.restore_cursor_position,
})

autocmd("BufRead", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.opt_local.wrap = true
      vim.opt_local.number = false
      vim.opt_local.linebreak = true
    end
  end,
})
