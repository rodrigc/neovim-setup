vim.lsp.config('terraformls', {
    flags = {
      debounce_text_changes = 150,
      exit_timeout = false,
    }
})

vim.lsp.enable("terraformls")

local format_sync_grp = vim.api.nvim_create_augroup("Format", { clear = false})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.tf",
  callback = function()
   vim.lsp.buf.format({ timeout_ms = 200 })
  end,
  group = format_sync_grp,
})
