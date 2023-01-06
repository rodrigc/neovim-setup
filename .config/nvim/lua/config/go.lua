local lsp = require('config/lsp')

require('go').setup({lsp_cfg = true, lsp_on_attach = lsp.on_attach})

-- Run goimport on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
