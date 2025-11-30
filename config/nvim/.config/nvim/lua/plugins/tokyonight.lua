return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    on_highlights = function(hl, cls)
      hl.ColorColumn = { bg = cls.fg_gutter }
    end
  },
}
