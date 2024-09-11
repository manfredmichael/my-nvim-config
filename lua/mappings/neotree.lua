-- lua/mappings/neotree.lua

-- Import your neotree.lua from the configs folder
local neotree = require('configs.neotree')

-- Call the setup function for NeoTree
neotree.setup()

-- Bind the toggle function to <leader>e
vim.api.nvim_set_keymap('n', '<leader>e', ':lua require("configs.neotree").toggle()<CR>', { noremap = true, silent = true })
