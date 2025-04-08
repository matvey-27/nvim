-- ~/.config/nvim/lua/neo-tree.lua
local neotree = require("neo-tree")

-- Настройка горячих клавиш
vim.keymap.set('n', 'e', ':Neotree left<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'o', ':Neotree float git_status<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Настройка Neo-tree
neotree.setup({
    filesystem = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },
        filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = false,
        }
    }
})