return {
  'cbochs/grapple.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('grapple').setup()

    vim.keymap.set('n', '<leader>gt', require('grapple').popup_tags, { desc = 'Show Grapple Popup' })

    vim.keymap.set('n', "<leader>h", function()
      require('grapple').select({ key = "h" })
    end, { desc = "Grapple goto file (h)" })
    vim.keymap.set('n', "<leader>H", function()
      require('grapple').toggle({ key = "h" })
    end, { desc = "Toggle grapple (h)" })

    vim.keymap.set('n', "<leader>j", function()
      require('grapple').select({ key = "j" })
    end, { desc = "Grapple goto file (j)" })
    vim.keymap.set('n', "<leader>J", function()
      require('grapple').toggle({ key = "j" })
    end, { desc = "Toggle grapple (j)" })

    vim.keymap.set('n', "<leader>k", function()
      require('grapple').select({ key = "k" })
    end, { desc = "Grapple goto file (k)" })
    vim.keymap.set('n', "<leader>K", function()
      require('grapple').toggle({ key = "k" })
    end, { desc = "Toggle grapple (k)" })

    vim.keymap.set('n', "<leader>l", function()
      require('grapple').select({ key = "l" })
    end, { desc = "Grapple goto file (l)" })
    vim.keymap.set('n', "<leader>L", function()
      require('grapple').toggle({ key = "l" })
    end, { desc = "Toggle grapple (l)" })
  end,
}
