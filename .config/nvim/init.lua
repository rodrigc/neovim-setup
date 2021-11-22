require('plugins')
require('config/keybindings')
require('config/colorscheme')

require('completion')
require('lsp')
require('rust') 

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
