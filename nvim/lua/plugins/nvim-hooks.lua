return {
  "bersalazar/nvim-plugins",
  name = "nvim-hooks",
  keys = {
    { "<leader>gt", mode = "x", function() require("nvim-hooks.gtasks").create_from_selection() end, desc = "Google Task from selection" },
  },
}
