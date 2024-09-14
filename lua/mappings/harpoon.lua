local config = require('configs.harpoon')

vim.keymap.set("n", "<leader>b", function() config.toggle_telescope(config.get_harpoon_list()) end, { desc = "Open harpoon window" })
