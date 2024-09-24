return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
    name = "tokyonight",
		config = function()
			require("tokyonight").setup({
				-- use the night style
				style = "moon",
				-- disable italic for functions
				styles = {
					functions = {},
				},
				-- Change the "hint" color to the "orange" color, and make the "error" color bright red
				on_colors = function(colors)
					colors.hint = colors.orange
					colors.error = "#ff0000"
				end,
			})
      vim.cmd.colorscheme("tokyonight")
		end,
	},
}
