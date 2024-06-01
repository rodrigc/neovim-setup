local nvim_lsp = require('lspconfig')

nvim_lsp["lua_ls"].setup {
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

--vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*.lua",
--  callback = function()
--    vim.lsp.buf.format({ timeout_ms = 200 })
--  end,
--  group = format_sync_grp,
--})
