-- NvimTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- :nnoremap <silent> <Leader><Space> :set hlsearch<CR>
-- vim.api.nvim_set_keymap('n', '<Leader><Space>', ':set hlsearch!<CR>', { noremap = true, silent = true })
-- :nnoremap <silent> <Leader>tegf <Cmd>lua require('telescope.builtin').git_files()<CR>
-- vim.api.nvim_set_keymap('n', '<Leader>tegf',  [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })
-- :noremap <buffer> <expr> cc line('.') == 1 ? 'cc' : 'ggcc'
-- vim.api.nvim_buf_set_keymap(0, '', 'cc', 'line(".") == 1 ? "cc" : "ggcc"', { noremap = true, expr = true })

-- Code navigation shortcuts
-- as found in :help lsp
vim.api.nvim_set_keymap('n', 'K', [[<Cmd>lua vim.lsp.buf.hover()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gD', [[<Cmd>lua vim.lsp.buf.implementation()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', [[<Cmd>lua vim.lsp.buf.signature_help()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '1gD', [[<Cmd>lua vim.lsp.buf.type_definition()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', [[<Cmd>lua vim.lsp.buf.references()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g0', [[<Cmd>lua vim.lsp.buf.document_symbol()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gW', [[<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', [[<Cmd>lua vim.lsp.buf.definition()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ga', [[<Cmd>lua vim.lsp.buf.code_action()<CR>]], { noremap = true, silent = true })