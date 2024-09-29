-- lua/mappings/focus.lua
local plugin = require "configs.focus"

-- Call the setup fuction for Focus 
plugin.setup()

-- Bind the toggle function to <leader>mm
vim.keymap.set("n", "<leader>mm", plugin.toggle, {})
