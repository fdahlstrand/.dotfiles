return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }

      require("telescope").load_extension("live_grep_args")
      pcall(require('telescope').load_extension, 'fzf')

      local function grep_orgfiles()
        require('telescope').extensions.live_grep_args.live_grep_args {
          search_dirs = { "~/orgfiles/" },
          prompt_title = "Search orgfiles"
        }
      end

      local function find_orgfiles()
        require('telescope.builtin').find_files {
          search_dirs = { "~/orgfiles/" },
          prompt_title = "Find orgfiles"
        }
      end

      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
      vim.keymap.set('n', '<leader>og', grep_orgfiles, { desc = 'Search orgfiles ' })
      vim.keymap.set('n', '<leader>of', find_orgfiles, { desc = 'Find orgfiles ' })
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end
  },
}
