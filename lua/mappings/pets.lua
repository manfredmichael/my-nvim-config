local config = require('configs.pets')
local pets = config.pets

vim.api.nvim_set_keymap("n", "<leader>dp", ":PetsNew dog brown<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ph", ":PetsHide<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ps", ":PetsShow<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
--brew install --cask kitty vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-m>", function() harpoon:list():select(4) end)
--
-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
-- vim.keymap.set("n", "<leader>b", function() config.toggle_telescope(config.get_harpoon_list()) end, { desc = "Open harpoon window" })
