return {
  "CopilotC-Nvim/CopilotChat.nvim",
  lazy = false,
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {
    model = "claude-opus-4.6",
    temperature = 0.1,           -- Lower = focused, higher = creative
    window = {
      layout = 'vertical', -- 'horizontal', float, 'vertical'
      width = 100, -- Fixed width in columns
      height = 10, -- Fixed height in rows
    },

    headers = {
      user = 'Bernardo',
      assistant = 'Copilot',
      tool = 'Tool',
    },

    highlight_headers = false,
    separator = '━━',
    error_header = '> [Error]',

    auto_fold = true, -- Automatically folds non-assistant messages
    auto_insert_mode = false,     -- Enter insert mode when opening
    auto_follow_cursor = true,     -- Automatically follow the cursor
    insert_at_end = true,

    mappings = {
      close = {
        normal = "<C-c>",
        insert = "<C-c>",
      },
      submit_prompt = {
        normal = "<A-Enter>",
        insert = "<A-Enter>",
      },
    },
  },
}
