return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          "nvim-tree/nvim-web-devicons",
        },
        lazy = false,  
        keys = {
            { "<C-b>", ":Neotree toggle<CR>", desc = "Toggle Neo-Tree (File Explorer)" },
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    position = "left",  
                    width = 30,
                },
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_hidden = false,
                        never_show = {  
                            ".git",
                        },
                    },
                    follow_current_file = {
                        enabled = true,   
                    },
                }
            })
        end,
    },
}
