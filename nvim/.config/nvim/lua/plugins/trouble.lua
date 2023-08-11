return {
  'folke/trouble.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  keys = {
    {
      "<leader>cd",
      function()
        require('trouble').toggle()
      end,
      desc = "Toggle diagnostics"
    },
  },
}
