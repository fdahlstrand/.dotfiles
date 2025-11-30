return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  requires = { { 'nvim-lua/plenary.nvim' } },
  opts = {
    pickers = {
      man_pages = {
        sections = { "1", "2", "3", "7", "8" },
      },
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('cmake4vim')
  end,
}
