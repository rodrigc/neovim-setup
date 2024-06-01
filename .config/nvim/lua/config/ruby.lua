local nvim_lsp = require('lspconfig')

nvim_lsp["solargraph"].setup {
    flags = {
      debounce_text_changes = 150,
    }
}
