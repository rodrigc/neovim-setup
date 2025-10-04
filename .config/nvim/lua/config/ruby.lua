vim.lsp.config('solargraph', {
    flags = {
      debounce_text_changes = 150,
      exit_timeout = false,
    }
})

vim.lsp.enable('solargraph')
