return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")

    -- Disable nvim-cmp in markdown files
    cmp.setup.filetype("markdown", {
      enabled = false,
    })
  end,
}
