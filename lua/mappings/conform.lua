-- Import your neotree.lua from the configs folder
local plugin = require('configs.conform')

-- Call the setup function for NeoTree
plugin.setup()

vim.keymap.set('n', '<leader>fm', plugin.format, {})
