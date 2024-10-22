local nvim_lsp = require('lspconfig')

-- https://github.com/craftzdog/dotfiles-public/blob/105681a36498d9514e5221f2f8f6ab08e2d2c10c/.config/nvim/plugin/lspconfig.lua#L75
nvim_lsp.ts_ls.setup {
    filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
    cmd = { "typescript-language-server", "--stdio" },
    flags = {
      debounce_text_changes = 150,
    }
}

nvim_lsp.tailwindcss.setup{}
