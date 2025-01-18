return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  init = function()
    vim.keymap.set('n', '-', '<Cmd>Oil<CR>', { desc = 'Open parent directory' })
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' }
}
