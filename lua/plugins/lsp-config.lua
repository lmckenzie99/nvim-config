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

			-- Configure LSP servers using vim.lsp.config (new API)
			-- Standard LSP servers
			vim.lsp.config('lua_ls', {
				capabilities = capabilities,
			})

			vim.lsp.config('ts_ls', {
				capabilities = capabilities,
			})

			vim.lsp.config('pylsp', {
				capabilities = capabilities,
			})

			vim.lsp.config('clangd', {
				capabilities = capabilities,
			})

			-- Custom Asteroid LSP server configuration
			vim.lsp.config('asteroid', {
				cmd = { 'node', vim.fn.expand('~/.local/share/asteroid-lsp/out/server.js'), '--stdio' },
				filetypes = { 'asteroid' },
				root_dir = function(filename, bufnr)
					return vim.fs.root(bufnr, {'.git', 'package.json', '.asteroid-project'})
				end,
				capabilities = capabilities,
				settings = {
					asteroid = {
						enableSyntaxHighlighting = true,
						enableAutocompletion = true,
						enableDiagnostics = true,
					}
				}
			})

			-- Filetype detection for Asteroid files
			vim.filetype.add({
				extension = {
					ast = 'asteroid',
					asteroid = 'asteroid',
				},
			})

			-- Enable all configured LSP servers
			vim.lsp.enable('lua_ls')
			vim.lsp.enable('ts_ls')
			vim.lsp.enable('pylsp')
			vim.lsp.enable('clangd')
			vim.lsp.enable('asteroid')

			-- LSP keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
