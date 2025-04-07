-- Collection of common configurations for the Nvim LSP client
return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = function()
			require('mason').setup()
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = false,
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = {
					'lua_ls',
					'rust_analyzer',
					-- 'solargraph',
					-- 'tsserver',
					'ts_ls',
					'ruff',
					'terraformls',
					'tailwindcss',
					'cssls',
				}
			}
		end,
	},
	{
		'neovim/nvim-lspconfig',
		lazy = false,
	},
	{
		-- Extensions to built-in LSP, for example, providing type inlay hints
		'nvim-lua/lsp_extensions.nvim',
		lazy = false,
	}
}
