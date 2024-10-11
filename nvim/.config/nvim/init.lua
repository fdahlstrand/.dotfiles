vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  concurrency = 2
})

require('gtd')

vim.o.hlsearch = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.breakindent = true
vim.o.undofile = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect,preview'
vim.o.termguicolors = true
vim.o.colorcolumn = "78"
vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { desc = "Goto next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")


local function is_wsl()
  local f = io.open("/proc/version", "r")
  local content = ""

  if f ~= nil then
    content = f:read("*a")
    io.close()
  end

  return string.match(content, "microsoft")
end

if is_wsl() then
  -- This is very slow, do not use together with vim.o.clipboard = unnamedplus
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = '/mnt/c/Windows/System32/clip.exe',
      ['*'] = '/mnt/c/Windows/System32/clip.exe',
    },
    paste = {
      ['+'] =
      '/mnt/c/Windows/System32/WindowsPowershell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] =
      '/mnt/c/Windows/System32/WindowsPowershell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
else
  vim.g.clipboard = 'unnamedplus'
end
vim.keymap.set('n', '<leader>yy', "\"+yy", { desc = "Copy current line into system clipboard" })
vim.keymap.set('v', '<leader>y', "\"+y", { desc = "Copy selected line into system clipboard" })
vim.keymap.set('n', '<leader>p', "\"+p", { desc = "Paste contents from system clipboard after cursor" })
vim.keymap.set('n', '<leader>P', "\"+P", { desc = "Paste contents from system clipboard before cursor" })
vim.keymap.set('v', '<leader>p', "\"+p", { desc = "Replace selected text with contents from system clipboard" })

vim.cmd([[autocmd FileType nim setlocal commentstring=#\ %s]])

vim.cmd([[colorscheme tokyonight-night]])
local colors = require("tokyonight.colors").setup()
vim.cmd([[highlight ColorColumn guibg=]] .. colors.bg_highlight)
