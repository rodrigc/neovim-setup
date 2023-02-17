local nvim_lsp = require('lspconfig')

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
nvim_lsp["ruff_lsp"].setup {
    on_attach = require('config/lsp').on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}
