return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require('oil')

    oil.setup({
      default_file_explorer = false,
      float = {
        border = "single"
      },
      keymaps_help = {
        border = "single",
      }
    })

    vim.keymap.set("n", "-", "<Cmd>Oil --float<CR>", { desc = "Open parent directory " })
  end
}
