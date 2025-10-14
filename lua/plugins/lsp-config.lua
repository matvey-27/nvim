return {
  "mason-org/mason.nvim",
  config = function()
    require("mason").setup()
  end,
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = {
    ensure_installed = { "tsserver", "lua_ls" },
    automatic_installation = true,
    automatic_enable = true,
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = { "tsserver", "lua_ls" },
      automatic_installation = true,
      automatic_enable = true,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local function on_attach(client, bufnr)
      -- Настройка горячих клавиш
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
    end

    -- Настройка серверов
    mason_lspconfig.setup_handlers({
      function(server_name)
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }
        require("lspconfig")[server_name].setup(opts)
      end,
    })
  end,
}

