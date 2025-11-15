return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>dd", "<cmd>DiffviewOpen<CR>",      desc = "Open Diffview" },
    { "<leader>dh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
    { "<leader>dc", "<cmd>DiffviewClose<CR>",     desc = "Close Diffview" },
  },
  config = function()
    require("diffview").setup({
        diff_binaries = false,
        enhanced_diff_hl = true,
        use_icons = true,
        watch_index = true,
        icons = {
            folder_closed = "",
            folder_open   = "",
        },
        signs = {
            fold_closed = "",
            fold_open   = "",
            done        = "✓",
        },
        view = {
        default = {
            layout             = "diff2_horizontal",
            disable_diagnostics = false,
            winbar_info        = false,
        },
        merge_tool = {
            layout             = "diff3_horizontal",
            disable_diagnostics = true,
            winbar_info        = true,
        },
        file_history = {
            layout             = "diff2_horizontal",
            disable_diagnostics = false,
            winbar_info        = false,
            position           = "bottom",
            height             = 16,
            win_opts           = {},
        },
        },
        default_args = {
            DiffviewOpen        = {},
            DiffviewFileHistory = {},
        },
        hooks = {},
        keymaps = {
            disable_defaults = false,
        }
    })

  end
}
