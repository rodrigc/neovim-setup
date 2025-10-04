-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- Taken from: https://github.com/neovim/nvim-lspconfig/blob/master/README.md#keybindings-and-completion
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
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
		local opts = { buffer = ev.buf, silent = true }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1}) end, opts)
		vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1}) end, opts)
		vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
		vim.keymap.set('n', '<space>f', vim.lsp.buf.format, opts)

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
