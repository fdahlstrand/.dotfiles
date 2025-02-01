return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'j-hui/fidget.nvim',     opts = {} },
      { "stevearc/conform.nvim", },
      {
        'seblj/roslyn.nvim',
        ft = 'cs',
        opts = {
          config = {
            settings = {
              ['csharp|code_lens'] = {
                dotnet_enable_references_code_lens = false,
              },
            },
          },
        },
      },
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require 'lspconfig'.lua_ls.setup {
        capabilities = capabilities,
        cmd = { vim.fn.expand('$HOME/language-servers/lua-language-server/bin/lua-language-server') }
      }

      require 'lspconfig'.ocamllsp.setup {
        capabilities = capabilities,
        settings = {
          codelens = { enable = true },
          inlayHints = { enable = true },
        },
      }

      vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
        callback = function()
          vim.lsp.codelens.refresh()
        end
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local telescope = require 'telescope.builtin'
          print('LspAttach-ing')

          vim.keymap.set('n', 'gd', telescope.lsp_definitions, { buffer = 0 })
          vim.keymap.set('n', 'gr', telescope.lsp_references, { buffer = 0 })
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = 0 })
          vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer = 0 })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })

          vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { buffer = 0 })
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0 })
        end,
      })

      require('conform').setup {
        formatters_by_ft = {
          ocaml = { 'ocamlformat' },
        },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        callback = function(args)
          require('conform').format {
            bufnr = args.buf,
            lsp_fallback = true,
            quiet = true,
          }
        end
      })
    end,
  },
}
