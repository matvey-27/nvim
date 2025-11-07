vim.opt.encoding = 'utf-8'

vim.opt.tabstop = 4               
vim.opt.softtabstop = 4            
vim.opt.shiftwidth = 4 
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>N', function()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Переключить нумерацию строк" })

require("config.lazy")
