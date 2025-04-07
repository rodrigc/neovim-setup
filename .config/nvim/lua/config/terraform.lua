local nvim_lsp = require('lspconfig')

nvim_lsp["terraformls"].setup {
    flags = {
      debounce_text_changes = 150,
    }
}

local format_sync_grp = vim.api.nvim_create_augroup("Format", { clear = false})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.tf",
  callback = function()
   vim.lsp.buf.format({ timeout_ms = 200 })
  end,
  group = format_sync_grp,
})

--
-- local mason_registry = require("mason-registry")
-- local package = mason_registry.get_package('terraform-ls')
-- local terraformls_path = package:get_install_path() .. '/terraform-ls'
--
-- local config = {
--     cmd = { terraformls_path, "serve" },
--     filetypes = { "terraform", "hcl", "terraform-vars", "tf", "tfvars" },
--     root_dir = vim.fn.getcwd(),
--     flags = {
--         debounce_text_changes = 150,
--     },
--     capabilities = vim.lsp.protocol.make_client_capabilities(),
-- }
--
-- -- Use an autocmd to start and attach the LSP to appropriate filetypes
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "terraform", "hcl", "terraform-vars", "tf", "tfvars" },
--     callback = function()
--         -- Ensure the root directory and buffer setup happens dynamically
--         config.root_dir = vim.fn.getcwd()
--         vim.lsp.start(config)
--     end,
-- })
