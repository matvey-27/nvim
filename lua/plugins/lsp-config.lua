return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { "tsserver", "lua_ls" },
        automatic_installation = true,
        automatic_enable = true,
      })

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local function on_attach(client, bufnr)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })

        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { buffer = bufnr, desc = "Показать ошибки" })
      end
      
      local servers = require('mason-lspconfig').get_installed_servers()
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
            debounce_text_changes = 150,
          },
        })
      end

      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local kind_icons = {
        Text = "", Method = "m", Function = "F", Constructor = "c", Field = "f",
        Variable = "v", Class = "C", Interface = "I", Module = "M", Property = "p",
        Unit = "U", Value = "V", Enum = "E", Keyword = "K", Snippet = "S",
        Color = "o", File = "F", Reference = "R", Folder = "F", EnumMember = "E",
        Constant = "C", Struct = "S", Event = "e", Operator = "O", TypeParameter = "T",
      }

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-Space>'] = cmp.mapping.complete(),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = kind_icons[vim_item.kind] or ""
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
            })[entry.source.name]
            return vim_item
          end,
        },
        window = {
          completion = { border = "rounded" },
          documentation = { border = "rounded" },
        },
      })
    end,
  },
}