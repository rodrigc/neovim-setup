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

  -- ncm2 completion manager
  'ncm2/ncm2',

  -- fuzzy finder
  'junegunn/fzf',
  'junegunn/fzf.vim',


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
  {
      'mrcjkb/rustaceanvim',
      version = '^4',
      lazy = false,
  },
  -- RustPlay support
  'mattn/webapi-vim',


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

}
