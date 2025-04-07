-- ALE Configuration
vim.g.ale_disable_lsp = 1  -- Disable ALE's LSP integration since we're using native LSP

-- Configure linters
vim.g.ale_linters = {
	go = {'gofmt', 'golangci-lint'},  -- Removed deprecated linters
}

-- Configure fixers
vim.g.ale_fixers = {
	go = {'gofmt', 'goimports'},
}

-- Only run linters on save
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_enter = 0
vim.g.ale_lint_on_save = 1

-- Use floating windows for ALE messages
vim.g.ale_use_global_executables = 1
vim.g.ale_floating_preview = 1

-- Set up ALE completion
vim.g.ale_completion_enabled = 0  -- Disable ALE completion since we're using nvim-cmp

-- Set up ALE signs
vim.g.ale_sign_error = '✖'
vim.g.ale_sign_warning = '⚠'

-- Set up ALE virtual text
vim.g.ale_virtualtext_cursor = 1
vim.g.ale_virtualtext_prefix = '● '

-- Set up ALE hover
vim.g.ale_hover_to_floating_preview = 1
