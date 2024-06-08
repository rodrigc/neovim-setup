-- NvimTree
vim.keymap.set('n', '<C-n>', function() require('nvim-tree.api').tree.toggle(true) end,
	{ silent = true, desc = 'NVIM Tree file explorer' })

-- Telescope
vim.keymap.set('n', 'fb', function() require('telescope.builtin').buffers() end,
	{ silent = true, desc = 'Telescope buffers' })
vim.keymap.set('n', 'ff', function() require('telescope.builtin').find_files() end,
	{ silent = true, desc = 'Telescope find_files' })
vim.keymap.set('n', 'fr', function() require('telescope.builtin').live_grep() end,
	{ silent = true, desc = 'Telescope live_grep' })
vim.keymap.set('n', '<Leader>tegf', function() require('telescope.builtin').git_files() end,
	{ silent = true, desc = 'Telescope git files' })

-- Move between Vim Windows
vim.keymap.set('n', '<up>', "<C-W><up>", { noremap = false })
vim.keymap.set('n', '<down>', "<C-W><down>", { noremap = false })
vim.keymap.set('n', '<left>', "<C-W><left>", { noremap = false })
vim.keymap.set('n', '<right>', "<C-W><right>", { noremap = false })
-- Resize Vim Windows
vim.keymap.set('n', '<S-up>', ":resize -2<CR>", { silent = true })
vim.keymap.set('n', '<S-down>', ":resize +2<CR>", { silent = true })
vim.keymap.set('n', '<S-left>', ":vertical resize -2<CR>", { silent = true })
vim.keymap.set('n', '<S-right>', ":vertical resize +2<CR>", { silent = true })

-- Open terminal inside new window
vim.keymap.set('n', '<Leader>tt', ":vnew|terminal<CR>", { silent = true, desc = 'open new terminal' })
