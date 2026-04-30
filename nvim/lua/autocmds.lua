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
  pattern = "*.md",
  callback = function()
    vim.opt_local.conceallevel = 0
    vim.b.copilot_enabled = false

    local ns_notes = vim.api.nvim_create_namespace("notes_colors")
    local ns_copilot = vim.api.nvim_create_namespace("copilot_colors")

    hl(ns_notes, "Normal", { bg = "#343434" })
    hl(ns_notes, "CursorLine", { bg = "#3a3a3a" })
    hl(ns_notes, "Visual", { bg = "#484848" })

    hl(ns_notes, "@markup.quote", { fg = "#808080" })

    hl(ns_notes, "DiffText", { fg = "#c8c8c8", bold = true })
    hl(ns_notes, "@markup.heading.1.markdown", { fg = "#c8c8c8", bold = true })

    hl(ns_notes, "DiffAdd", { fg = "#a0a8a0", })
    hl(ns_notes, "@markup.heading.2.markdown", { fg = "#a0a8a0", bold = true })

    hl(ns_notes, "DiffChange", { fg = "#a0a8a0", })
    hl(ns_notes, "@markup.heading.3.markdown", { fg = "#a0a8a0" })

    hl(ns_notes, "DiffDelete", { fg = "#ccb0b0" })
    hl(ns_notes, "@markup.heading.4.markdown", { fg = "#ccb0b0" })

    hl(ns_notes, "@markup.heading.5.markdown", { fg = "#b0b4cc" })
    hl(ns_notes, "@markup.heading.6.markdown", { fg = "#a0a8a0" })

    -- hl(ns_notes, "RenderMarkdownCode", { fg = "#b0b0b0", })
    -- hl(ns_notes, "@markup.raw.block.markdown", { fg = "#b0b0b0",})

    -- CopilotChat palette (cool, distinct from notes)
    hl(ns_copilot, "Normal", { fg = "#c8c8c8", bg = "#1c1e20" })
    hl(ns_copilot, "CursorLine", { bg = "#242628" })
    hl(ns_copilot, "Visual", { fg = "#c8c8c8", bg = "#383a3c" })
    hl(ns_copilot, "@markup.heading.1.markdown", { fg = "#d0d4dc", bg = "#2a2d35" })
    hl(ns_copilot, "@markup.heading.2.markdown", { fg = "#b4bcc8", bg = "#282c32" })

    -- Detect buffer type and apply the appropriate namespace
    local buf = vim.api.nvim_win_get_buf(0)
    local ft = vim.bo[buf].filetype
    local bufname = vim.api.nvim_buf_get_name(buf)

    if ft == "copilot-chat" then
      vim.api.nvim_win_set_hl_ns(0, ns_copilot)
    elseif bufname:match("notes") or ft == "markdown" then
      vim.api.nvim_win_set_hl_ns(0, ns_notes)
    else
      vim.api.nvim_win_set_hl_ns(0, 0)
    end
    -- if bufname:match("notes") or ft == "markdown" then
    --   vim.api.nvim_win_set_hl_ns(0, ns_notes)
    -- else
    --   vim.api.nvim_win_set_hl_ns(0, 0)
    -- end
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
