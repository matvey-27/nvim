-- Автоматическая установка lazy.nvim при необходимости
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Инициализация плагинов с помощью lazy.nvim
require('lazy').setup({
  -- стартовое окно
  { "startup-nvim/startup.nvim" },

  -- Цветовые схемы
  { 'rebelot/kanagawa.nvim' },
  { 'morhetz/gruvbox' },

  -- Файловый менеджер и иконки
  { 'nvim-neo-tree/neo-tree.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvim-lua/plenary.nvim' },
  { "MunifTanjim/nui.nvim" },

  -- Вкладки файлов
  { 'romgrk/barbar.nvim' },

  -- Строка статуса
  { 'nvim-lualine/lualine.nvim' },

  -- Синтаксический анализ
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- LSP и автодополнение (вынесено в отдельный файл)
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },
  
  -- lsp-zero для упрощенной настройки LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }
})

-- Загрузка модулей
local home = os.getenv("HOME")
package.path = home .. "/.config/nvim/lua/?.lua;" .. package.path

require('theme')          -- Настройки темы
require('nvimtree')      -- Файловый менеджер
require('lua_line')      -- Строка статуса
require('treesitter')    -- Синтаксический анализ
require('lsp-config')    -- LSP конфигурация (вынесено)
require('common')        -- Общие настройки
require("bar")           -- Дополнительные настройки или модули, если есть
