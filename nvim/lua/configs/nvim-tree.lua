local funcs = require("funcs")

require("nvim-tree").setup({
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
})
