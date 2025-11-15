vim.opt.encoding = 'utf-8'

vim.opt.tabstop = 4               
vim.opt.softtabstop = 4            
vim.opt.shiftwidth = 4 
vim.opt.expandtab = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true
vim.keymap.set('n', '<leader>N', function()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Переключить нумерацию строк" })

vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = "Создать вертикальный сплит" })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = "Создать горизонтальный сплит" })
vim.keymap.set('n', '<leader>sq', '<C-w>c', { desc = "Закрыть сплит" })

require("config.lazy")
