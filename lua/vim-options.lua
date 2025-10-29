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
vim.keymap.set("n", "<Leader>st", "<ESC>:split<CR> :terminal<CR>", {})
vim.keymap.set("n", "<Leader>id", ":IBLDisableScope<CR>", {})
vim.keymap.set("n", "<Leader>ie", ":IBLEnableScope<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>co", ":!g++ % -o temp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>cr", ":split<CR> :terminal<CR> i ./temp<CR>", { noremap = true, silent = true })
vim.wo.relativenumber = true

vim.api.nvim_set_keymap("n", "<Leader>dr", ":split<CR> :terminal<CR> i dart run ", { noremap = true, silent = true })
vim.cmd([[command! Qa :qa]])
vim.cmd([[command! Q :q]])

vim.filetype.add({
	extension = {
		pl = "prolog",
	},
})

