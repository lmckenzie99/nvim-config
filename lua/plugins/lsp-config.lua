return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			local lspconfig = require("lspconfig")
			
			-- Your existing LSP servers
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			-- Asteroid LSP setup
			local configs = require('lspconfig.configs')
			if not configs.asteroid then
				configs.asteroid = {
					default_config = {
						cmd = { 'node', vim.fn.expand('~/.local/share/asteroid-lsp/out/server.js'), '--stdio' },
						filetypes = { 'asteroid' },
						root_dir = lspconfig.util.root_pattern('.git', 'package.json', '.asteroid-project'),
						settings = {
							asteroid = {
								enableSyntaxHighlighting = true,
								enableAutocompletion = true,
								enableDiagnostics = true,
							}
						}
					}
				}
			end

			lspconfig.asteroid.setup({
				capabilities = capabilities,
			})

			-- Filetype detection for Asteroid files
			vim.filetype.add({
				extension = {
					ast = 'asteroid',
					asteroid = 'asteroid',
				},
			})

			-- Your existing keymaps (unchanged)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
