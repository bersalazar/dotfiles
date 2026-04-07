return {
  "github/copilot.vim",
  lazy = false,
  init = function()
    vim.g.copilot_filetypes = {
      ["*"] = true,
      markdown = false,
    }
  end,
}
