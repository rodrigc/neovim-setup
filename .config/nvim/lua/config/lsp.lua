-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- Taken from: https://github.com/neovim/nvim-lspconfig/blob/master/README.md#keybindings-and-completion
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local lsp_keymap_set = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				buffer = ev.buf,
				silent = true,
				desc = desc,
			})
		end

		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client == nil then
			return
		end

		-- Enable completion using new API
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end

		-- Note: LSP-driven folding is disabled by default
		-- To enable folding for a buffer, you can use:
		-- vim.opt.foldmethod = "expr"
		-- vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"

		-- Mappings using new API style
		lsp_keymap_set('n', 'gD', vim.lsp.buf.declaration, 'LSP: Go to declaration')
		lsp_keymap_set('n', 'gd', vim.lsp.buf.definition, 'LSP: Go to definition')
		lsp_keymap_set('n', 'gi', vim.lsp.buf.implementation, 'LSP: Go to implementation')
		lsp_keymap_set('n', 'gr', vim.lsp.buf.references, 'LSP: List references')
		lsp_keymap_set('n', 'K', vim.lsp.buf.hover, 'LSP: Hover documentation')
		lsp_keymap_set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, 'LSP: Add workspace folder')
		lsp_keymap_set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, 'LSP: Remove workspace folder')
		lsp_keymap_set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, 'LSP: List workspace folders')
		lsp_keymap_set('n', '<space>D', vim.lsp.buf.type_definition, 'LSP: Go to type definition')
		lsp_keymap_set('n', '<space>rn', vim.lsp.buf.rename, 'LSP: Rename symbol')
		lsp_keymap_set('n', '<space>ca', vim.lsp.buf.code_action, 'LSP: Code action')
		lsp_keymap_set('n', '<space>e', vim.diagnostic.open_float, 'Show diagnostic message')
		lsp_keymap_set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, 'Previous diagnostic')
		lsp_keymap_set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, 'Next diagnostic')
		lsp_keymap_set('n', '<space>q', vim.diagnostic.setloclist, 'Set loclist')
		lsp_keymap_set('n', '<space>f', vim.lsp.buf.format, 'Format buffer')

		-- Get signatures (and _only_ signatures) when in argument lists
		require("lsp_signature").on_attach({
			doc_lines = 10,
		})
	end,
})

-- Enable rounded borders in floating windows
vim.o.winborder = 'rounded'

local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
	capabilities = capabilities,
}
