require('config/lazy') -- needs to be first in init.lua in order to load plugins

require('config/options')

require('config/notify')
require('config/keybindings')
require('config/treesitter')

require('completion')

require('config/go')
require('config/javascript')
require('config/lua')
require('config/protobuf')
require('config/python')
require('config/rust')
require('config/ruby')
require('config/terraform')

require('config/telescope')
require('config/ale')
require('config/web-tools')
