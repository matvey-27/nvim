-- Автоматическая установка vim-plug при необходимости
local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if not vim.loop.fs_stat(plug_path) then
  vim.fn.system({
    'curl',
    '-fLo',
    plug_path,
    '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  })
end

local vim = vim
local Plug = vim.fn['plug#']

-- Инициализация плагинов
vim.call('plug#begin', vim.fn.stdpath('data') .. '/plugged')

-- Цветовые схемы
Plug('rebelot/kanagawa.nvim')
Plug('morhetz/gruvbox')

-- Файловый менеджер и иконки
Plug('nvim-neo-tree/neo-tree.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-lua/plenary.nvim')
Plug("MunifTanjim/nui.nvim")

-- Вкладки файлов
Plug('romgrk/barbar.nvim')

-- Строка статуса
Plug('nvim-lualine/lualine.nvim')

-- Синтаксический анализ
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- LSP и автодополнение (вынесено в отдельный файл)
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
vim.call('plug#', 'VonHeikemen/lsp-zero.nvim', {['branch'] = 'v3.x'})

vim.call('plug#end')

home=os.getenv("HOME")
package.path = home .. "/.config/nvim/lua/?.lua;" .. package.path

-- Загрузка модулей
require('theme')          -- Настройки темы
require('nvimtree')        -- Файловый менеджер
require('lua_line')       -- Строка статуса
require('treesitter')     -- Синтаксический анализ
require('lsp-config')     -- LSP конфигурация (вынесено)
require('common')         -- Общие настройки
require("bar")