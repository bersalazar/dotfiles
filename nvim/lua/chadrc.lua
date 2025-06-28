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

-- M.plugins = {
--     ["nvim-telescope/telescope.nvim"] = {
--         override_options = function()
--             return {
--                 defaults = {
--                     pickers = {
--                       find_files = {
--                         find_command = {
--                           'fd',
--                           '--type',
--                           'f',
--                           '--color=never',
--                           '--hidden',
--                           '--follow',
--                           '-E',
--                           '.git/*'
--                         }
--                       }
--                     }
--                 }
--             }
--         end,
--     }
-- }

M.ui = {
  -- I don't enjoy tabufline. It has a funky way of dealing with tabs.
  tabufline = {
      enabled = false,
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

-- M.ui.statusline.theme = "vscode_colored"

return M
