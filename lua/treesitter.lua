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
