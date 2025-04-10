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