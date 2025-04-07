-- Rust programming language configuration for neovim
--
-- See https://sharksforarms.dev/posts/neovim-rust/
-- See: https://github.com/mrcjkb/rustaceanvim

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append('c')

--vim.g.rustfmt_options = "--edition 2021"

local lsp = require('config/lsp')

local cfg = require('rustaceanvim.config')

local home = '/Users/crodrigues/'
local extension_path = home .. '.local/share/nvim/mason/packages/codelldb/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

vim.g.rustaceanlocal = {
	tools = { -- rust-tools options
	},

	-- debugging stuff
	dap = {
		adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path)
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	server = {
		capabilities = lsp.capabilities,

		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				cargo = {
					features = "all",
				},
				-- Add the following line to enable rustfmt on save
				["rust-analyzer.rustfmt.overrideCommand"] = { "rustfmt", "--edition", "2021", "--emit=stdout" },

				-- Taken from https://book.leptos.dev/getting_started/leptos_dx.html
				-- Other Settings ...
				procMacro = {
					ignored = {
						leptos_macro = {
							-- optional: --
							-- "component",
							"server",
						},
					},
				},
			}
		}
	},
}

local format_sync_grp = vim.api.nvim_create_augroup("Format", { clear = false })
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.rs",
	callback = function()
		vim.lsp.buf.format({ timeout_ms = 200 })
	end,
	group = format_sync_grp,
})
