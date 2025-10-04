vim.lsp.config('protols', {
    cmd = {vim.fn.stdpath("data") .. "/mason/bin/protols"}, -- Use Mason's installed path
    filetypes = {"proto"},
    root_dir = require("lspconfig.util").root_pattern("buf.yaml", ".git"),
})

vim.lsp.enable('protols')
