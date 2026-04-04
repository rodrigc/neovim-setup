-- Install parsers that aren't already present
local ensure_installed = {
  'lua',
  'vim',
  'vimdoc',
  'javascript',
  'typescript',
  'html',
  'css',
  'json',
  'yaml',
  'markdown',
  'bash',
  'go',
  'rust',
  'python',
  'terraform',
}

local already_installed = require('nvim-treesitter.config').get_installed()
local to_install = vim.iter(ensure_installed)
  :filter(function(parser)
    return not vim.tbl_contains(already_installed, parser)
  end)
  :totable()

if #to_install > 0 then
  require('nvim-treesitter').install(to_install)
end

-- Highlighting: built-in Neovim API
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter_highlight', { clear = true }),
  pattern = ensure_installed,
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Folding: built-in Neovim API
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter_folds', { clear = true }),
  pattern = ensure_installed,
  callback = function()
    vim.wo[0][0].foldmethod = 'expr'
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldenable = false
  end,
})
