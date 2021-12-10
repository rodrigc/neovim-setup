local lspconfig = require('lspconfig')
local lsp = require('lsp')

lspconfig.gopls.setup {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
