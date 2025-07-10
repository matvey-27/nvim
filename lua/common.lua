-- отобразить номера строк
vim.wo.number = true
-- включить управление мышью
vim.g.mouse = 'a'
vim.opt.encoding="utf-8"
-- выключаем своп файла
vim.opt.swapfile = false

-- устанавливаем настройки табуляции и отступов
vim.opt.scrolloff = 7
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

vim.opt.fileformat = "unix"

-- Установка пробела как leader (рекомендуется)
vim.g.mapleader = " "
vim.g.maplocalleader = " "  -- Локальный leader для файл-специфичных keymaps

local dap = require('dap')

-- Шаги на удобные клавиши, например:
vim.keymap.set('n', '<Leader>n', dap.step_over, { desc = "Шаг через (next)" })       -- например, <Leader>n
vim.keymap.set('n', '<Leader>i', dap.step_into, { desc = "Шаг внутрь (into)" })      -- например, <Leader>i
vim.keymap.set('n', '<Leader>o', dap.step_out, { desc = "Шаг из функции (out)" })    -- например, <Leader>o
vim.keymap.set('n', '<Leader>c', dap.continue, { desc = "Продолжить выполнение" })   -- например, <Leader>c

-- Остальные оставим на привычные клавиши или тоже заменим по вкусу:
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = "Точка останова" })
vim.keymap.set('n', '<Leader>B', function()
  dap.set_breakpoint(vim.fn.input("Условие: "))
end, { desc = "Точка с условием" })
vim.keymap.set('n', '<Leader>du', require('dapui').toggle, { desc = "Открыть/закрыть UI отладки" })
vim.keymap.set('n', '<Leader>dx', dap.terminate, { desc = "Остановить отладку" })
vim.keymap.set('n', '<Leader>dr', dap.restart, { desc = "Перезапустить отладку" })