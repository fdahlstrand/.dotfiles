return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      auto_install = false,
      highlight = {
        enable = true,
      }
    },
  },
}
