-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- Taken from: https://github.com/neovim/nvim-lspconfig/blob/master/README.md#keybindings-and-completion
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- Enable completion triggered by <c-x><c-o>
		if client.server_capabilities.completionProvider then
			vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
		end
		if client.server_capabilities.definitionProvider then
			vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.tagfunc"
		end

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { silent = true, desc = "jump to declaration" })
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, desc = "jump to definition" })
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
			{ silent = true, desc = "list all implementations of symbol" })
		vim.keymap.set('n', 'gr', vim.lsp.buf.references,
			{ silent = true, desc = "list all references to symbol" })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, desc = "display hover information" })
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
			{ silent = true, desc = "display signature information" })
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { silent = true, })
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { silent = true, })
		vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
			{ silent = true, })
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
			{ silent = true, desc = "jump to type definition" })
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename,
			{ silent = true, desc = 'rename all references to symbol' })
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { silent = true, })
		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { silent = true, })
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true, desc = 'go to next diagnostic' })
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true, desc = 'go to previous diagnostic' })
		vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { silent = true, })
		vim.keymap.set('n', '<space>f', vim.lsp.buf.format, { silent = true, desc = "format buffer" })

		-- Get signatures (and _only_ signatures) when in argument lists.
		--
		require("lsp_signature").on_attach({
			doc_lines = 10,
		})
	end,
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
	capabilities = capabilities,
}
