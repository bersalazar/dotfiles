require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- require custom functions, useful for custom behavior mapped to keys, like nvim-tree's adaptive resize.
local funcs = require("funcs")

-- disable default mappings
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("n", "<leader>e")
nomap("n", "<A-h>")

-- essential navigation
map("n", "<C-h>", ":wincmd h <CR>")
map("n", "<C-j>", ":wincmd j <CR>")
map("n", "<C-k>", ":wincmd k <CR>")
map("n", "<C-l>", ":wincmd l <CR>")
map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
map("n", "<C-s>", "<cmd>Telescope live_grep<CR>")
map("n", "<C-a>", "<cmd>Telescope buffers<CR>")
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
map("n", "<leader>co", ":CopilotToggle<CR>")
map("n", "<leader>cs", ":Copilot status<CR>")
map("n", "<leader>h", ":Copilot status<CR>")

--tab management
map("n", "<A-t>", ":tabnew<CR>")
map("n", "<A-h>", ":tabprevious<CR>")
map("n", "<A-l>", ":tabnext<CR>")
map("n", "<A-q>", ":tabclose<CR>")
map("n", "<A-o>", ":tabonly<CR>")
map("n", "<A-1>", ":tabnext 1<CR>")
map("n", "<A-2>", ":tabnext 2<CR>")
map("n", "<A-3>", ":tabnext 3<CR>")
map("n", "<A-4>", ":tabnext 4<CR>")
map("n", "<A-5>", ":tabnext 5<CR>")

-- coding goodies
map('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
map("n", "zO", "zz")
map("n", "<S-f>", ":lua vim.diagnostic.open_float()<CR>")
map('v', '<leader>fix', ":'<,'>CopilotChatFix<CR>")
map('n', '<leader>ch', ":CopilotChat<CR>")
map('n', '<C-M>', ":'<,'>CopilotChat<CR>")
map('v', '<C-M>', ":'<,'>CopilotChat<CR>")
map('n', '<leader>ex', ":'<,'>CopilotExplain<CR>")
map('n', '<leader>opt', ":'<,'>CopilotOptimize<CR>")

-- dap debugging
map("n", "<leader>db", ":DapToggleBreakpoint<CR>")
map("n", "<leader>ds", ":DapNew<CR>")
map("n", "<leader>dc", ":DapContinue<CR>")
map("n", "<leader>dx", ":DapDisconnect<CR>")
map("n", "<leader>dl", ":DapClearBreakpoints<CR>")
map("n", "<leader>di", ":DapStepInto<CR>")
map("n", "<leader>do", ":DapStepOut<CR>")
map("n", "<leader>dp", ":DapStepOver<CR>")
map("n", "<leader>dui", ":lua require('dapui').open()<CR>")
map("n", "<leader>dux", ":lua require('dapui').close()<CR>")

-- Custom user commands
local cmds = vim.api.nvim_create_user_command

-- replace Nvchads save with an override.
cmds("W", ":w", {})
cmds("WL", ":set wrap linebreak", {})
cmds("FormatJson", ":%!jq .", {})
cmds("SourceVimrc", ":source ~/.config/nvim/init.lua", {})
cmds("RemoveWhitespace", ":%s/\\s\\+$//e", {})
cmds("Mdp", ":MarkdownPreview", {})
cmds("CopilotToggle", funcs.toggle_copilot, {})
cmds("IsCopilotEnabled", ":lua print(vim.g.copilot_enabled)", {})

-- toggle nvim-tree width between fixed and adaptive
map("n", "<C-a>", funcs.toggle_width_adaptive)
