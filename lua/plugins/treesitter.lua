return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "c", "cpp", "lua", "vim" , "markdown", "markdown_inline" },
            auto_install = true,
            highlight = {
                enable = true,
            },
            folds = {
                enable = true,
            },
        }
        vim.opt.foldlevel = 99
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.keymap.set('n', 'za', 'za', { desc = "Переключить свернуть/развернуть" })
    end
}
