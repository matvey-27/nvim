require('lualine').setup ({
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  })

-- Barbar: управление вкладками (основные)
-- Alt + стрелки
vim.keymap.set('n', '<A-Left>', '<Cmd>BufferPrevious<CR>')  -- Предыдущая вкладка
vim.keymap.set('n', '<A-Right>', '<Cmd>BufferNext<CR>')     -- Следующая
-- Alt + hjkl (альтернатива)
vim.keymap.set('n', '<A-h>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<A-l>', '<Cmd>BufferNext<CR>')

-- Управление вкладками
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>')        -- Закрыть
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPick<CR>')         -- Выбрать вручную

-- Перемещение вкладок
-- Shift + Alt + стрелки
vim.keymap.set('n', '<A-S-Left>', '<Cmd>BufferMovePrevious<CR>')
vim.keymap.set('n', '<A-S-Right>', '<Cmd>BufferMoveNext<CR>')
-- Shift + Alt + hjkl (альтернатива)
vim.keymap.set('n', '<A-S-h>', '<Cmd>BufferMovePrevious<CR>')
vim.keymap.set('n', '<A-S-l>', '<Cmd>BufferMoveNext<CR>')

-- Быстрый переход (Alt+1..9)
for i = 1, 9 do
  vim.keymap.set('n', ('<A-%s>'):format(i), ('<Cmd>BufferGoto %s<CR>'):format(i))
end

-- Дополнительные удобные сочетания
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPin<CR>')     -- Закрепить вкладку
vim.keymap.set('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>') -- Оставить только текущую