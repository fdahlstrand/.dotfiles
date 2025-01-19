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
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      require'lspconfig'.lua_ls.setup {
        cmd = { vim.fn.expand('$HOME/language-servers/lua-language-server/bin/lua-language-server') }
      }
      
    end,
  },
}
