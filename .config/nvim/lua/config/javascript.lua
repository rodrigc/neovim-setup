-- https://github.com/craftzdog/dotfiles-public/blob/105681a36498d9514e5221f2f8f6ab08e2d2c10c/.config/nvim/plugin/lspconfig.lua#L75
vim.lsp.config('ts_ls', {
    filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
    cmd = { "typescript-language-server", "--stdio" },
    flags = {
      debounce_text_changes = 150,
      exit_timeout = false,
    }
})

vim.lsp.enable('tsls')
vim.lsp.enable('tailwindcss')
