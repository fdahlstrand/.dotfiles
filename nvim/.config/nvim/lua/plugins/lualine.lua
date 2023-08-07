return {
  'nvim-lualine/lualine.nvim',

  opts = {
    options = {
      icons_enabled = false,
      theme = 'tokyonight',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_b = {
        {
          function()
            local key = require('grapple').key()
            return '  [' .. key .. ']'
          end,
          cond = require('grapple').exists
        }
      },
    },
  }
}
