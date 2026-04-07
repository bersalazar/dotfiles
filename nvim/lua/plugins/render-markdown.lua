return {
  'MeanderingProgrammer/render-markdown.nvim',
  lazy = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  opts = {
    sign = {
      enabled = false,
    },
    heading = {
      sign = false,
      position = "inline",
      icons = { '' },
    },
    code = {
      sign = true,
      language_pad = 2,
    },
    file_types = { 'markdown', 'copilot-chat' },
  },
  ft = { 'markdown', 'copilot-chat' },
}
