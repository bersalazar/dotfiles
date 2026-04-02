local funcs = require("funcs")

return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
      width = {
        min = 30,
        max = funcs.get_view_width_max,
      },
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false
        }
      }
    }
  }
}
