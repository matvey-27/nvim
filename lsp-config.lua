-- lsp-config.lua
local lsp_zero = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
})

-- Что такое loader?
-- В Neovim "loader" (загрузчик) - это механизм, который управляет:
-- 1. Загрузкой модулей Lua (через require)
-- 2. Инициализацией плагинов
-- Например, когда вы пишете require('lsp-zero'), Neovim ищет модуль в:
-- - runtimepath (папки lua/)
-- - установленных плагинах

-- Настройка keymaps
lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false, desc = 'LSP: '}
  
  -- Просмотр документации
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>dk', function()
    local float = vim.lsp.util.open_floating_preview(
      vim.lsp.util.convert_input_to_markdown_lines(
        vim.lsp.buf_get_clients()[1].request('textDocument/hover', {
          textDocument = vim.lsp.util.make_text_document_params(),
          position = vim.lsp.util.make_position_params()
        })
      ), 'markdown')
    vim.api.nvim_buf_set_option(float.bufnr, 'filetype', 'markdown')
  end, opts)

  -- Навигация
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

  -- Работа с ошибками
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>dl', function()
    vim.diagnostic.setloclist({open = true})
  end, opts)

  -- Другие действия
  vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
end)

-- Настройка Mason (менеджер LSP серверов)
require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Настройка LSP серверов
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {globals = {'vim'}},
            workspace = {checkThirdParty = false},
            telemetry = {enable = false}
          }
        }
      })
    end,
  }
})

-- Настройка автодополнения
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- Инициализация LSP
lsp_zero.setup()

-- Дополнительные настройки диагностики
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})