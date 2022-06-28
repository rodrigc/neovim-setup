require'lspconfig'.solargraph.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  --Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf.set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
  vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references)
  vim.keymap.set('n', '<space>e', vim.lsp.diagnostic.show_line_diagnostics)
  vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.lsp.diagnostic.set_loclist)
  vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}
end
