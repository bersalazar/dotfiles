local cmds = vim.api.nvim_create_user_command

-- replace Nvchads save with an override.
cmds("W", ":w", {})
cmds("WL", ":set wrap linebreak", {})
cmds("FormatJson", ":%!jq .", {})
cmds("SourceVimrc", ":source ~/.config/nvim/init.vim", {})
cmds("HorizontalTerminalSplit", ":split term://zsh", {})
cmds("VerticalTerminalSplit", ":vsplit term://zsh", {})
cmds("TerminalInNewTab", ":tabnew term://zsh", {})
cmds("Mdp", ":MarkdownPreview", {})
cmds("RnuToggle", ":set rnu!", {})
--cmds("RemoveWhitespace", ":%s/\s\+$//e", {})
