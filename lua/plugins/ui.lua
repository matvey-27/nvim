return {
    'folke/noice.nvim',
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("noice").setup({
        views = {
          messages = {
            view = "popup",
            size = { min = 10, max = 20 },
          },
          health = {
            view = "popup",
            size = { min = 20, max = 30 },
          },
        },
      })
    end
}