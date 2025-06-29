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
  -- Стартовый экран (альфа)
  {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = {
        "███╗   ███╗ ██████╗ ███████╗     ██████╗ ██████╗ ██████╗ ███████╗ ",
        "████╗ ████║██╔════╝ ██╔════╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝",
        "██║╚██╔╝██║██║   ██║██╔══╝      ██║     ██║   ██║██║  ██║██╔══╝  ",
        "██║ ╚═╝ ██║╚██████╔╝███████╗    ╚██████╗╚██████╔╝██████╔╝███████╗",
        "╚═╝     ╚═╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝",
        "                       *nvim config                             "
      }

      dashboard.section.buttons.val = {
        {
          type='button',
          val='f (find file)',
          on_press=function()
            require('telescope.builtin').find_files()
          end,
          opts={ hl='SpecialKey', width=20 }
        },
        {
          type='button',
          val='h (old files)',
          on_press=function()
            require('telescope.builtin').oldfiles()
          end,
          opts={ hl='SpecialKey', width=20 }
        },
        {
          type='button',
          val='s (settings)',
          on_press=function()
            vim.cmd('edit ~/.config/nvim/init.lua')
          end,
          opts={ hl='SpecialKey', width=20 }
        },
        {
          type='button',
          val='q (exit)',
          on_press=function()
            vim.cmd('qa')
          end,
          opts={ hl='SpecialKey', width=20 }
        },
      }

      -- Стиль
      local section = dashboard.section
      section.header.opts.hl = 'Type'
      for _, button in ipairs(section.buttons.val) do
        button.opts.hl = 'Keyword'
      end

      alpha.setup(dashboard.config)
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  },
  -- Цветовые схемы
  { 'rebelot/kanagawa.nvim' },
  { 'morhetz/gruvbox' },
  { 'sainnhe/everforest' },

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
  },

  -- терминал
  { 'akinsho/toggleterm.nvim' }
})

-- Загрузка модулей
local home = os.getenv("HOME")
package.path = home .. "/.config/nvim/lua/?.lua;" .. package.path

require('theme')         -- Настройки темы
require('nvimtree')      -- Файловый менеджер
require('lua_line')      -- Строка статуса
require('treesitter')    -- Синтаксический анализ
require('lsp-config')    -- LSP конфигурация (вынесено)
require('common')        -- Общие настройки
require('bar')           -- Дополнительные настройки или модули, если есть
require('term')
