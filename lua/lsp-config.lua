local lsp_zero = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = false,
  manage_nvim_cmp = false,
})

-- Настройка Mason без автоматической установки
require('mason').setup()
require('mason-lspconfig').setup({
  -- Не указываем automatic_installation
  ensure_installed = { 'tsserver' } -- список только нужных серверов
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
      vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
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
  snippet={
    expand=function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- Включение настроек lsp-zero
lsp_zero.setup()

-- Настройки диагностики
vim.diagnostic.config({
  virtual_text=true,
  signs=true,
  update_in_insert=false,
  underline=true,
  severity_sort=true,
  float={
    focusable=false,
    style='minimal',
    border='rounded',
    source='always',
    header='',
    prefix='',
  }
})
