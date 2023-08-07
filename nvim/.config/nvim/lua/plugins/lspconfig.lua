return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      'williamboman/mason.nvim',
      cmd = 'Mason',
      opts = {}
    },
    {
      'williamboman/mason-lspconfig.nvim',
      cmd = { 'LspInstall', 'LspUninstall' },
      opts = {
        ensure_installed = {
          'lua_ls',
          'rust_analyzer',
        },
      }
    },

    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    'folke/neodev.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    local on_attach = function(client, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end
      nmap("K", vim.lsp.buf.hover, 'Hover Documentation')

      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end
    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        }
      },
      rust_analyzer = {
        ['rust_analyzer'] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    }

    require('neodev').setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities()

    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes
        }
      end
    }
  end
}
