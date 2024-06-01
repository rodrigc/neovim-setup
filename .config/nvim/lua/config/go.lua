require('go').setup(
{
	lsp_cfg = true,
})

local format_sync_grp = vim.api.nvim_create_augroup("Format", { clear = false})
-- Run goimport on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
