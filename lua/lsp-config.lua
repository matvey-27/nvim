local lsp_zero = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = false,
  manage_nvim_cmp = false,
})

-- Настройка Mason без автоматической установки
require('mason').setup()
require('mason-lspconfig').setup({
  -- Не указываем automatic_installation
  ensure_installed = { "tsserve" } -- список только нужных серверов
})

local lspconfig = require('lspconfig')

-- Получаем список установленных серверов Mason
local servers = require('mason-lspconfig').get_installed_servers()

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = function(client, bufnr)
      local opts = {buffer = bufnr}

      -- Настройка ключевых комбинаций
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

      -- Навигация по ошибкам
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>dl', function()
        vim.diagnostic.setloclist({open=true})
      end, opts)

      -- Работа с rename и code actions
      vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)

      -- Подсказки при вводе (в insert режиме)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
    flags = {
      debounce_text_changes = 150,
    },
    -- Можно добавить настройки для конкретных серверов при необходимости
  })
end

-- Настройка автодополнения с nvim-cmp
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
-- Добавляем плагины для иконок и форматирования
local luasnip = require('luasnip')

-- Улучшаем внешний вид иконок
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "F",
  Constructor = "c",
  Field = "f",
  Variable = "v",
  Class = "C",
  Interface = "I",
  Module = "M",
  Property = "p",
  Unit = "U",
  Value = "V",
  Enum = "E",
  Keyword = "K",
  Snippet = "S",
  Color = "o",
  File = "F",
  Reference = "R",
  Folder = "F",
  EnumMember = "E",
  Constant = "C",
  Struct = "S",
  Event = "e",
  Operator = "O",
  TypeParameter = "T",
}

cmp.setup({
  sources = {
    {name='nvim_lsp'},
    {name='luasnip'},
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select=true }),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  snippet = {
    -- Привязываем LuaSnip к nvim-cmp
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    -- Настраиваем внешний вид
    format = function(entry, vim_item)
      -- Добавляем иконки
      vim_item.kind = kind_icons[vim_item.kind] or ""
      -- Делаем текст более читабельным
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
      })[entry.source.name]
      return vim_item
    end
  },
  -- Добавляем скругление углов для окна автодополнения
  window = {
    completion = {
      border = "rounded",
    },
    documentation = {
      border = "rounded",
    },
  },
})
