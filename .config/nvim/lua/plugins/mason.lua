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
		dependencies = {
			'williamboman/mason.nvim',
			'neovim/nvim-lspconfig',
		},
		opts = {
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
				'neocmake',
			},
			automatic_enable = {
				exclude = {
					"rust_analyzer"  -- handled by rustacean.nvim
				}
			}
		}
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
