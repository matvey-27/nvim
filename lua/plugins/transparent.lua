return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({
            groups = {
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                'EndOfBuffer',
            },
            extra_groups = {},
            exclude_groups = {},
            on_clear = function() end,
        })

        require('transparent').clear_prefix('BufferLine')
        require('transparent').clear_prefix('NeoTree')
        require('transparent').clear_prefix('lualine')

        vim.keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<CR>", { desc = "Toggle transparency" })
    end
}