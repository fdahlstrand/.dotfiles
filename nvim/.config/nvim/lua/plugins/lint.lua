return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      python = {
        "mypy",
        "ruff"
      }
    }

    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
      callback = function()
        local lint_status, lint = pcall(require, "lint")
        if lint_status then
          lint.try_lint()
        end
      end
    })
  end
}
