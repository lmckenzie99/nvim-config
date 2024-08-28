vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.api.nvim_set_keymap("i", "<C-s>", "<ESC>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", "<ESC>:wa<CR>", {})
