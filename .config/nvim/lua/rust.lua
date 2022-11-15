-- Rust programming language configuration for neovim
--
-- See https://sharksforarms.dev/posts/neovim-rust/

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.opt.completeopt = {"menuone","noinsert","noselect"}

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append('c')

vim.g.rustfmt_options = "--edition 2021"

local lsp = require('lsp')

local home = '/Users/crodrigues/'
local extension_path = home .. '.vscode/extensions/vadimcn.vscode-lldb-1.6.10/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

local opts = {
    tools = { -- rust-tools options
    },

    -- debugging stuff
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        --on_attach = lsp.on_attach,
        --capabilities = lsp.capabilities,

        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                },
                -- enable clippy on save
                checkOnSave = {
                    command = "cargo clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
   vim.lsp.buf.formatting_sync(nil, 200)
  end,
  group = format_sync_grp,
})
