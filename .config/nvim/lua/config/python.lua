local nvim_lsp = require('lspconfig')

local ruff_on_attach = function(client, bufnr)
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
end

-- Configure `ruff`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff
-- For the default config, along with instructions on how to customize the settings
nvim_lsp.ruff.setup {
    on_attach = ruff_on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}

nvim_lsp.pyright.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}
