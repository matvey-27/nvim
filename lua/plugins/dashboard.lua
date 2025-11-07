return {
  'nvimdev/dashboard-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local dashboard = require('dashboard')
    dashboard.setup({
      theme = 'hyper',
      disable_move = false,
      shortcut_type = "letter",
      shuffle_letter = false,
      letter_list = "abcdefghijklmnopqrstuvwxyz",
      change_to_vcs_root = true,
      hide = {
        statusline = true,
        tabline    = true,
        winbar     = true,
      },
      config = {
        header = {
          "",
          "   ▄   ▄",
          "   █▀█▀█",
          "   █▄█▄█",
          "       ███  ▄▄",
          "        ████▐█ █",
          "        ████   █",
          "       ▀▀▀▀▀▀▀",
        },
        shortcut = {},
        mru = {
          enable   = true,
          limit    = 10,
          icon     = "🕘",
          label    = "Recent Files:",
          cwd_only = false,
        },
        footer = {},

      },
    })
  end
}
