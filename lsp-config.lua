local lsp_zero = require('lsp-zero').preset({
    name = 'recommended',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
  })
  
  -- Настройка keymaps
  lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  end)
  
  -- Настройка Mason
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
    ensure_installed = {'lua_ls'},  -- Автоустановка lua_ls
    handlers = {
      lsp_zero.default_setup,
      lua_ls = function()
        require('lspconfig').lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = {'vim'}
              },
              workspace = {
                checkThirdParty = false
              }
            }
          }
        })
      end,
    }
  })
  
  -- Настройка автодополнения
  local cmp = require('cmp')
  local cmp_select = {behavior = cmp.SelectBehavior.Select}
  local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<C-Space>'] = cmp.mapping.complete(),
  })
  
  cmp.setup({
    mapping = cmp_mappings,
    sources = {
      {name = 'nvim_lsp'},
      {name = 'luasnip'},
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  })
  
-- Упрощённая настройка автодополнения
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}), -- Enter для выбора
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {'i', 's'}),
  },
  sources = {
    {name = 'nvim_lsp'}, -- Только LSP-источник
  }
})

  -- Инициализация LSP
  lsp_zero.setup()