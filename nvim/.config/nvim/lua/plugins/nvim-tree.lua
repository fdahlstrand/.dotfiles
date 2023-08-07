return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>t', '<cmd>NvimTreeToggle<cr>', desc = "Toggle File Tree" },
  },
  opts = {
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  },
}
