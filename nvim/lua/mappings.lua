require "nvchad.mappings"

local map = vim.keymap.set

-- essential navigation
map("n", "<C-h>", ":wincmd h <CR>")
map("n", "<C-j>", ":wincmd j <CR>")
map("n", "<C-k>", ":wincmd k <CR>")
map("n", "<C-l>", ":wincmd l <CR>")
map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
map("n", "<C-s>", "<cmd>Telescope live_grep<CR>")
map("n", "<C-b>", "^")
map("n", "<S-b>", "$")
map("n", "<C-c>", "<ESC>")

-- goodies using the leader key (space)
map("n", "<leader>rn", ":set rnu!<CR>")
map("n", "<leader>ma", "<cmd>Telescope man_pages<CR>")
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>")
map("n", "<leader>sr", ":source ~/.config/nvim/init.vim")
map("n", "<leader>ff", ":NvimTreeFindFile<CR>")
map("n", "<leader>nn", ":nohlsearch<CR>")
map("n", "<leader>mdp", ":MarkdownPreview<CR>")
map("n", "<leader>co", ":CopilotToggle<CR>")
map("n", "<leader>cs", ":Copilot status<CR>")

-- coding goodies
map("n", "<C-/>", "gcc")
map('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
map("n", "zO", "zz")

local nomap = vim.keymap.del
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("n", "<leader>e")

-- Custom user commands
local cmds = vim.api.nvim_create_user_command

-- replace Nvchads save with an override.
cmds("W", ":w", {})
cmds("WL", ":set wrap linebreak", {})
cmds("FormatJson", ":%!jq .", {})
cmds("SourceVimrc", ":source ~/.config/nvim/init.lua", {})
cmds("RemoveWhitespace", ":%s/\\s\\+$//e", {})
cmds("Mdp", ":MarkdownPreview", {})
cmds("CopilotToggle", ":lua ToggleCopilot()", {})
cmds("IsCopilotEnabled", ":lua print(vim.g.copilot_enabled)", {})

-- supporting functions
function ToggleCopilot()
    if vim.g.copilot_enabled == 1 then
        vim.g.copilot_enabled = 0
    else
        vim.g.copilot_enabled = 1
    end
end
