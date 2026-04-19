return {
  'MeanderingProgrammer/render-markdown.nvim',
  lazy = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  opts = {
    heading = {
      sign = false,
      atx = true,
      position = "inline",
      icons = { '' },
      render_modes = { "i" },
    },
    paragraph = {
      render_modes = { "i" },
    },
    code = {
      enabled = false,
      sign = true,
      conceal_delimiters = false,
      language_pad = 2,
      render_modes = { "i" },
    },
    dash = {
      render_modes = { "i" },
    },
    list = {
      render_modes = { "i" },
    },
    checkbox = {
      render_modes = { "i" },
    },
    quote = {
      render_modes = { "i" },
    },
    pipe_table = {
      render_modes = { "i" },
    },
    link = {
      render_modes = { "i" },
    },
    sign = {
      enabled = false,
      render_modes = { "i" },
    },
    indent = {
      render_modes = { "i" },
    },
    file_types = { 'markdown', 'copilot-chat' },
  },
  ft = { 'markdown', 'copilot-chat' },
}
