vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.api.nvim_set_keymap("i", "<C-s>", "<ESC>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", "<ESC>:wa<CR>", {})
vim.keymap.set({ "n", "i" }, "<C-u>", "<ESC>:u<CR>", {})

--yeah I remapped hjkl, get over it
vim.keymap.set("n", "h", "<LEFT>", {})
vim.keymap.set("n", "j", "<UP>", {})
vim.keymap.set("n", "l", "<RIGHT>", {})
vim.keymap.set("n", "k", "<DOWN>", {})
