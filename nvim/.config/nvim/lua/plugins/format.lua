return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        python = { "isort", "black" },
        go = { "gofumpt", "goimports-reviser", "golines" }
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end
}
