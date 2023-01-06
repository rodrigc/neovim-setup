local nvim_lsp = require('lspconfig')

nvim_lsp["pyright"].setup {
    on_attach = require('config/lsp').on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}
