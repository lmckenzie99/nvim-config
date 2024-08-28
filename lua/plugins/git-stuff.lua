return {
	{
		"tpope/vim-fugitive",
        config = function ()
           vim.keymap.set("n", "<Leader>gp", ":Git push<CR>", {})
            vim.keymap.set("n", "Leader>gc", "Git commit<CR>",{})
        end
	},

	{
		"lewis6991/gitsigns.nvim",
		 config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<Leader>gp", ":Gitsigns preview_hunk<CR>", {})
		end
	}
}
