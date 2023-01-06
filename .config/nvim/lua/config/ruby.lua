local nvim_lsp = require('lspconfig')

local lsp = require('config/lsp')

nvim_lsp["solargraph"].setup {
    on_attach = lsp.on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}
