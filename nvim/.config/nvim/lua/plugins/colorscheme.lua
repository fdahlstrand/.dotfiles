return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme tokyonight-night]])

    local colors = require("tokyonight.colors")
    vim.cmd([[highlight ColorColumn guibg=]] .. colors.default.bg_highlight)
  end,
}
