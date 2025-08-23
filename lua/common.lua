-- ============================================================================
-- Общие настройки Neovim
-- ============================================================================

-- Устанавливаем отображение номеров строк
vim.wo.number = true

-- Включаем управление мышью для всех режимов
vim.g.mouse = 'a'

-- Устанавливаем кодировку файлов на UTF-8
vim.opt.encoding = 'utf-8'

-- Отключаем создание swap-файлов, чтобы не загромождать диск
vim.opt.swapfile = false

-- Устанавливаем отступы и табуляцию
vim.opt.tabstop = 4         -- Размер табуляции в пробелах
vim.opt.softtabstop = 4     -- Размер табуляции при нажатии <Tab>
vim.opt.shiftwidth = 4      -- Размер отступа при сдвиге
vim.opt.autoindent = true   -- Автоматический отступ для новой строки
vim.opt.expandtab = true    -- Преобразует символы табуляции в пробелы

-- Устанавливаем высоту прокрутки, чтобы курсор всегда оставался на расстоянии 7 строк от края
vim.opt.scrolloff = 7

-- Устанавливаем формат файла для Linux/macOS
vim.opt.fileformat = 'unix'

-- Всегда отображать статус-строку внизу экрана
vim.opt.laststatus = 2

-- Включаем подсветку синтаксиса
vim.cmd('syntax on')

-- Подсветка текущей строки
vim.opt.cursorline = true

-- Позволяем открывать новые сплиты внизу и справа по умолчанию
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Делаем подсветку по мере ввода для быстрого поиска
vim.opt.incsearch = true

-- Игнорируем регистр при поиске, если запрос написан в нижнем регистре
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ============================================================================
-- Горячие клавиши (Keymaps)
-- ============================================================================

-- Установка пробела как leader (рекомендуется)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Подключение Telescope для быстрого поиска файлов и буферов
vim.keymap.set('n', '<leader>t', ':Telescope find_files<CR>', { desc = "Найти файл (Telescope)" })

-- Переключает между обычной и относительной нумерацией строк
vim.keymap.set('n', '<leader>N', function()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Переключить нумерацию строк" })

-- Управление окнами (сплитами)
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = "Создать вертикальный сплит" })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = "Создать горизонтальный сплит" })
vim.keymap.set('n', '<leader>sq', '<C-w>c', { desc = "Закрыть сплит" })

-- Управление буферами
vim.keymap.set('n', '<leader>bb', ':Telescope buffers<CR>', { desc = "Переключиться на другой буфер" })
vim.keymap.set('n', '<leader>bq', ':bd<CR>', { desc = "Закрыть текущий буфер" })

-- ============================================================================
-- Отладка (DAP)
-- ============================================================================

local dap = require('dap')

-- Настройка горячих клавиш для отладчика (DAP)
vim.keymap.set('n', '<Leader>n', dap.step_over, { desc = "Шаг через (next)" })
vim.keymap.set('n', '<Leader>i', dap.step_into, { desc = "Шаг внутрь (into)" })
vim.keymap.set('n', '<Leader>o', dap.step_out, { desc = "Шаг из функции (out)" })
vim.keymap.set('n', '<Leader>c', dap.continue, { desc = "Продолжить выполнение" })
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = "Точка останова" })
vim.keymap.set('n', '<Leader>B', function()
  dap.set_breakpoint(vim.fn.input("Условие: "))
end, { desc = "Точка с условием" })

-- Управление UI отладки
vim.keymap.set('n', '<leader>du', require('dapui').toggle, { desc = "Открыть/закрыть UI отладки" })
vim.keymap.set('n', '<leader>dx', dap.terminate, { desc = "Остановить отладку" })
vim.keymap.set('n', '<leader>dr', dap.restart, { desc = "Перезапустить отладку" })

-- ============================================================================
-- Сворачивание кода (Folds)
-- ============================================================================

-- Чтобы сворачивание работало, вам нужно установить плагин nvim-treesitter.
-- Он должен быть установлен через пакетный менеджер, например, packer.nvim.
-- Пример для packer: use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

-- Настройка Treesitter. Этот блок должен быть в вашем init.lua, чтобы настройки сработали.
require('nvim-treesitter.configs').setup({
  -- Обеспечиваем установку языков, которые вам нужны
  ensure_installed = { "c", "cpp", "lua", "python", "javascript", "typescript", "go", "rust", "vimdoc" },
  -- Включаем подсветку
  highlight = {
    enable = true,
  },
  -- Включаем интеллектуальный отступ
  indent = {
    enable = true
  },
  -- Включаем сворачивание на основе структуры кода
  folds = {
    enable = true,
    -- Отключение сворачивания для определенных языков, если нужно
    disable = {},
  },
  -- Включаем инкрементное выделение текста
  incremental_selection = {
    enable = true,
  },
  -- Включаем текстовые объекты
  textobjects = {
    enable = true,
  },
})

-- Устанавливаем foldmethod для использования Treesitter. Эта команда должна идти после
-- вызова `require('nvim-treesitter.configs').setup`.
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Устанавливаем уровень сворачивания, чтобы все было развернуто по умолчанию
vim.opt.foldlevel = 99

-- Горячие клавиши для управления сворачиванием
vim.keymap.set('n', 'za', 'za', { desc = "Переключить свернуть/развернуть" })
vim.keymap.set('n', 'zc', 'zc', { desc = "Свернуть" })
vim.keymap.set('n', 'zo', 'zo', { desc = "Развернуть" })
vim.keymap.set('n', 'zM', 'zM', { desc = "Свернуть все" })
vim.keymap.set('n', 'zR', 'zR', { desc = "Развернуть все" })
