local funcs = require("funcs")
local autocmd = vim.api.nvim_create_autocmd
local hl = vim.api.nvim_set_hl

-- open nvim-tree automatically when opening a directory
autocmd("VimEnter",
  {
    callback = funcs.open_nvim_tree,
  }
)

-- restore the cursor position when opening a file
autocmd("BufReadPost", {
  pattern = "*",
  callback = funcs.restore_cursor_position,
})

-- set specific settings when opening markdown files
autocmd("BufRead", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.opt_local.wrap = true
      vim.opt_local.number = false
      vim.opt_local.linebreak = true
    end
  end,
})

-- set specific settings when opening copilot-chat buffers, and disable copilot for these buffers since they are not meant for writing code
autocmd("BufEnter", {
  pattern = "copilot-chat",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.conceallevel = 0
    vim.b.copilot_enabled = false

    -- create a unique namespace, useful for changing the background only to the copilot-chat buffer
    local ns_copilot = vim.api.nvim_create_namespace('CustomBackground')
    -- set the background color for the Normal highlight group in this namespace
    hl(ns_copilot, "Normal", { bg = "#343434" })
    -- apply the namespace to the current window
    vim.api.nvim_win_set_hl_ns(0, ns_copilot)
  end,
})
--
-- set specific settings and color palette for when working on my notes
autocmd("BufEnter", {
  pattern = "*/notes/*.md",
  callback = function()
    vim.opt_local.conceallevel = 0
    vim.b.copilot_enabled = false

    local ns_notes = vim.api.nvim_create_namespace("notes_colors")
    local ns_copilot = vim.api.nvim_create_namespace("copilot_colors")

    hl(ns_notes, "Normal", { fg = "#343434", bg = "#d4ced1" })
    hl(ns_notes, "CursorLine", { bg = "#cbc4c7" })
    hl(ns_notes, "Visual", { fg = "#343434", bg = "#b8b0b3" })

    -- Muted text (quotes, comments)
    hl(ns_notes, "@markup.quote", { fg = "#737373", bg = "#d4ced1" })
    hl(ns_notes, "@markup.heading.1.markdown", { fg = "#343434", bg = "#9da1ac" })

    -- Diff / Heading palette (progressively shifting hue from cool to warm)
    hl(ns_notes, "DiffText", { fg = "#343434", bg = "#9da1ac" })
    hl(ns_notes, "@markup.heading.1.markdown", { fg = "#343434", bg = "#9da1ac" })

    hl(ns_notes, "DiffAdd", { fg = "#343434", bg = "#a8b5a8" })
    hl(ns_notes, "@markup.heading.2.markdown", { fg = "#343434", bg = "#a8b5a8" })

    hl(ns_notes, "DiffChange", { fg = "#343434", bg = "#c4beb5" })
    hl(ns_notes, "@markup.heading.3.markdown", { fg = "#343434", bg = "#c4beb5" })

    hl(ns_notes, "DiffDelete", { fg = "#343434", bg = "#c9b5b5" })
    hl(ns_notes, "@markup.heading.4.markdown", { fg = "#343434", bg = "#c9b5b5" })

    hl(ns_notes, "@markup.heading.5.markdown", { fg = "#343434", bg = "#b5b8c4" })
    hl(ns_notes, "@markup.heading.6.markdown", { fg = "#343434", bg = "#bfc4be" })

    hl(ns_notes, "RenderMarkdownCode", { fg = "#343434", bg = "#b8b0b3" })
    hl(ns_notes, "@markup.raw.block.markdown", { fg = "#343434", bg = "#b8b0b3" })

    -- CopilotChat palette (cool, distinct from notes)
    hl(ns_copilot, "Normal", { fg = "#343434", bg = "#ced2d4" })
    hl(ns_copilot, "CursorLine", { bg = "#c4c9cb" })
    hl(ns_copilot, "Visual", { fg = "#343434", bg = "#b0b5b8" })
    hl(ns_copilot, "@markup.heading.1.markdown", { fg = "#343434", bg = "#9da1ac" })
    hl(ns_copilot, "@markup.heading.2.markdown", { fg = "#343434", bg = "#a1acb5" })

    -- Detect buffer type and apply the appropriate namespace
    local buf = vim.api.nvim_win_get_buf(0)
    local ft = vim.bo[buf].filetype
    local bufname = vim.api.nvim_buf_get_name(buf)

    if ft == "copilot-chat" then
      vim.api.nvim_win_set_hl_ns(0, ns_copilot)
    elseif bufname:match("notes") or ft == "markdown" then
      vim.api.nvim_win_set_hl_ns(0, ns_notes)
    else
      vim.api.nvim_win_set_hl_ns(0, 0) -- reset to global
    end
  end,
})

-- when a new response is added to the copilot-chat buffer, trigger BufWinEnter to re-apply the custom background color to the new buffer
autocmd("User", {
  pattern = "CopilotChatResponse",
  callback = function(ev)
    vim.api.nvim_exec_autocmds("BufWinEnter", { buffer = ev.buf })
  end,
})

-- start treesitter when opening certain file types,
-- since they have a lot of syntax highlighting and indenting issues without it
autocmd("FileType", {
  pattern = { "helm", "gotmpl", "markdown" },
  callback = function()
    vim.treesitter.start()
  end,
})
