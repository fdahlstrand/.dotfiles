return {
  'nvim-orgmode/orgmode',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
  },
  event = 'VeryLazy',
  config = function()
    -- Load treesitter grammar for org
    require('orgmode').setup_ts_grammar()

    -- Setup treesitter
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
      },
      ensure_installed = { 'org' },
    })

    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      org_tags_column = 78,
      org_capture_templates = {
        t = {
          description = 'Task',
          template = '** TODO %?\n   %U',
          target = '~/orgfiles/journal/%<%Y-%m-%d>.org',
          headline = "Inbox",
          properties = {
            empty_lines = 1
          }
        },
        i = {
          description = 'General Inbox Item',
          template = '** %?\n   %U',
          target = '~/orgfiles/journal/%<%Y-%m-%d>.org',
          headline = "Inbox",
          properties = {
            empty_lines = 1
          }
        },
        f = {
          description = 'Fleeting Thought',
          template = '** %U\n   %?',
          target = '~/orgfiles/journal/%<%Y-%m-%d>.org',
          headline = "Fleeting Thoughts",
          properties = {
            empty_lines = 1
          }
        },
        j = {
          description = 'Journal Entry',
          template = '** %U %?',
          target = '~/orgfiles/journal/%<%Y-%m-%d>.org',
          headline = "Journal",
          properties = {
            empty_lines = 1
          }
        }
      },
      mappings = {
        org = {
          org_toggle_checkbox = '<C-z>'
        }
      },

    })
  end,
}
