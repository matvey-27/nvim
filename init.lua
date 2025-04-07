-- Установка VimPlug
-- sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
--     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

home=os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path

-- темы
Plug('rebelot/kanagawa.nvim')
Plug('morhetz/gruvbox')

-- плагин nvim-tree и плагин для поддержки иконок файлов
Plug('kyazdani42/nvim-tree.lua')
Plug('kyazdani42/nvim-web-devicons')

-- BarBar - вкладки файлов
Plug('romgrk/barbar.nvim')

-- Lualine - строка статуса 
Plug('nvim-lualine/lualine.nvim') 

-- TreeSitter - дерево кода
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- LSP-сервер и mason
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
-- Plug("'VonHeikemen/lsp-zero.nvim'")

vim.call('plug#end')


dofile"theme.lua"

require"vimtree"

-- require"barbar"

require"lua_line"

require"treesitter"

require"lsp"

require"common"