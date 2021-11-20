-- This file can be loaded by calling `require('plugins')` from your init.lua

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- monokai colorscheme
  use 'tanvirtin/monokai.nvim'

  -- nvim-treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Asynchronous Linter (ale)
  use 'dense-analysis/ale'

  -- ncm2 completion manager
  use 'ncm2/ncm2'

  -- fuzzy finder
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Semantic language support
  -- Collection of common configurations for the Nvim LSP client
  use 'neovim/nvim-lspconfig'
  -- Extensions to built-in LSP, for example, providing type inlay hints
  use 'nvim-lua/lsp_extensions.nvim'
  
  -- Autocompletion framework
  use 'hrsh7th/nvim-cmp'
  -- cmp LSP completion
  use 'hrsh7th/cmp-nvim-lsp'
  -- cmp LUA completion
  --use 'hrsh7th/cmp-nvim-lua'
  -- cmp Snippet completion
  use 'hrsh7th/cmp-vsnip'
  -- cmp Path completion
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  -- See hrsh7th other plugins for more great completion sources!
  -- Snippet engine
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- Show function signature when you type
  use "ray-x/lsp_signature.nvim"

  -- Syntactic language support
  -- Rust
  use 'rust-lang/rust.vim'
  -- To enable more of the features of rust-analyzer, such as inlay hints and more!
  -- See: https://sharksforarms.dev/posts/neovim-rust/
  use 'simrat39/rust-tools.nvim'
  -- Go
  use 'fatih/vim-go'

  -- Optional dependencies
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Debugging (needs plenary from above as well) 
  use 'mfussenegger/nvim-dap'

  -- GUI enhancements 
  use 'itchyny/lightline.vim'

   -- Tree browser
   use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-tree').setup({}) end
   }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
