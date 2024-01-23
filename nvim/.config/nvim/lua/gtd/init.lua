local function create_journal_page()
  local date = os.date("%Y-%m-%d")
  local target = vim.fn.expand("~/orgfiles/journal/" .. date .. ".org")
  local file = vim.fn.resolve(vim.fn.fnamemodify(target, ":p"))
  if vim.fn.filereadable(file) == 0 then
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':h'), 'p')
    vim.fn.writefile({
      "#+title: Daily Journal - " .. date,
      "",
      "* Inbox                                                                       :INBOX:",
      "",
      "* Fleeting Thoughts                                                           :FLEETING:",
      "",
      "* Journal                                                                     :JOURNAL:",
    }, file)
  end
  print(file)
end

local function open_today()
  local date = os.date("%Y-%m-%d")
  vim.cmd("e " .. vim.fn.expand("~/orgfiles/journal/" .. date .. ".org"))
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = create_journal_page
})

vim.keymap.set('n', '<leader>oj', open_today, { desc = "Open daily journal page" })
