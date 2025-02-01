return {
  'christoomey/vim-tmux-navigator',
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
      on_highlights = function(highlights, colors)
        highlights.ColorColumn.bg = colors.bg_highlight
      end,
    },
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end
  },

}
