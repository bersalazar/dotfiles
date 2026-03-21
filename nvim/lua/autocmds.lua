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

-- set specific settings when opening markdown files
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

autocmd("BufEnter", {
  pattern = "copilot-chat",
  callback = function()
    vim.opt_local.number = false
    vim.b.copilot_enabled = false

    -- create a unique namespace, useful for changing the background only to the copilot-chat buffer
    local ns = vim.api.nvim_create_namespace('MyCustomBackground')
    -- set the background color for the Normal highlight group in this namespace
    vim.api.nvim_set_hl(ns, "Normal", { bg = "#414a4c" })
    -- apply the namespace to the current window
    vim.api.nvim_win_set_hl_ns(0, ns)
  end,
})
