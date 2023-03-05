return {
  -- monokai colorscheme
  {
    'tanvirtin/monokai.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme monokai]])
    end
  },

  'folke/which-key.nvim',

  -- nvim-treesitter
  {
       'nvim-treesitter/nvim-treesitter',
       build = ':TSUpdate'
  },

  -- Asynchronous Linter (ale)
  'dense-analysis/ale',

  -- ncm2 completion manager
  'ncm2/ncm2',

  -- fuzzy finder
  'junegunn/fzf',
  'junegunn/fzf.vim',

  -- Semantic language support
  -- Collection of common configurations for the Nvim LSP client
  'williamboman/nvim-lsp-installer',
  'neovim/nvim-lspconfig',
  -- Extensions to built-in LSP, for example, providing type inlay hints
  'nvim-lua/lsp_extensions.nvim',

  -- Autocompletion framework
  'hrsh7th/nvim-cmp',
  -- cmp LSP completion
  'hrsh7th/cmp-nvim-lsp',
  -- cmp LUA completion
  --'hrsh7th/cmp-nvim-lua',
  -- cmp Snippet completion
  'hrsh7th/cmp-vsnip',
  -- cmp Path completion
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  -- See hrsh7th other plugins for more great completion sources!
  -- Snippet engine
  'hrsh7th/vim-vsnip',
  'hrsh7th/vim-vsnip-integ',

  -- Show function signature when you type
  'ray-x/lsp_signature.nvim',

  -- Syntactic language support
  -- Rust
  -- 'rust-lang/rust.vim',
  -- To enable more of the features of rust-analyzer, such as inlay hints and more!
  -- See: https://sharksforarms.dev/posts/neovim-rust/
  'simrat39/rust-tools.nvim',
  -- RustPlay support
  'mattn/webapi-vim',

  -- Go
  -- 'fatih/vim-go',
  'ray-x/go.nvim',

  -- Optional dependencies
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
     'nvim-telescope/telescope-fzf-native.nvim',
     'nvim-telescope/telescope-ui-select.nvim',
    },
  },

  -- Debugging (needs plenary from above as well) 
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'theHamsta/nvim-dap-virtual-text',
  'ray-x/guihua.lua',

   -- Tree browser
   {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
	    require('nvim-tree').setup({})
    end
   },

   -- Comment.nvim
   {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
   },

   -- nicer UI for notifications
   'rcarriga/nvim-notify',

   -- use 'dstein64/vim-startuptime'

   -- database integration
   {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = 'tpope/vim-dadbod'
   },

   -- markdown preview
   {
    'davidgranstrom/nvim-markdown-preview'
   },

   {
    'Equilibris/nx.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require("nx").setup {}
    end
   },

}
