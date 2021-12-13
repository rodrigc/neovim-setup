-- NvimTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', 'fb',  [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ff',  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tegf',  [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })

-- Move between Vim Windows
vim.api.nvim_set_keymap('n', '<up>',  "<C-W><up>", { noremap = false })
vim.api.nvim_set_keymap('n', '<down>',  "<C-W><down>", { noremap = false })
vim.api.nvim_set_keymap('n', '<left>',  "<C-W><left>", { noremap = false })
vim.api.nvim_set_keymap('n', '<right>',  "<C-W><right>", { noremap = false })
-- Resize Vim Windows
vim.api.nvim_set_keymap('n', '<S-up>',  ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-down>',  ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-left>',  ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-right>',  ":vertical resize +2<CR>", { noremap = true, silent = true })
