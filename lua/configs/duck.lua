local M = {}

M.setup = function()
  require("duck").setup()
end

-- Function to toggle NeoTree
-- M.toggle = function()
--   local neotree = require("neo-tree.command")
--   -- Toggle NeoTree based on visibility
--   neotree.execute({ toggle = true, dir = vim.loop.cwd() })
-- end

return M
