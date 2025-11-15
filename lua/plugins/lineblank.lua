return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup{
            indent = { 
                highlight = highlight,
                char = "│",
            },
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = { "dashboard", "alpha", "startify" },
                buftypes  = { "nofile", "prompt", "terminal" },
            },
        }
    end
}
