vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.g.cmake_kits_global_path = vim.fn.getenv('HOME') .. '/.config/cmake4vim/.cmake-kits.json'
vim.g.cmake_selected_kit = "clang"
vim.g.cmake_build_type = "Debug"
vim.g.cmake_build_executor = 'dispatch'
vim.g.cmake_build_dir = 'build'
