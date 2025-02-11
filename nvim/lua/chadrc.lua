-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "doomchad",
  theme_toggle = {
    "doomchad",
    "material-lighter",
  },
  integrations = {
    "statusline",
  },
}

M.ui = {
  -- I don't enjoy tabufline. It has a funky way of dealing with tabs.
  tabufline = {
      enabled = false
  },

  telescope = {
    style = "bordered",
  },

  statusline = {
    theme = "vscode",
    separator_style = "arrow",
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "cwd",
      "cursor"
    },
  }
}

return M
