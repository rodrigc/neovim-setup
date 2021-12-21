local lspconfig = require('lspconfig')
local lsp = require('lsp')


-- lspconfig.gopls.setup {
--   capabilities = lsp.capabilities,
--   on_attach = lsp.on_attach,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }

require('go').setup({lsp_cfg = true, lsp_on_attach = lsp.on_attach})

-- Run goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

