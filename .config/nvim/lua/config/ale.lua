vim.g.ale_linters_ignore = {
	go = {'golint', 'govet'},
}
vim.g.ale_linters = {
	go = {'gofmt', 'golint', 'gopls', 'govet', 'golangci-lint'},
}
