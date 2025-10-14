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
            })
        end,
    },
}
