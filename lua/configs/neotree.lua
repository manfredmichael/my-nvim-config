local M = {}

M.setup = function()
  require("neo-tree").setup({
    filesystem = {
      follow_current_file = true,
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false
      }
    },
    window = {
    mappings = {
      ["s"] = "open_split",       -- Horizontal split
      ["v"] = "open_vsplit",      -- Vertical split
      -- Other key mappings
    },
  },
  })
end

-- Function to toggle NeoTree
M.toggle = function()
  local neotree = require("neo-tree.command")
  -- Toggle NeoTree based on visibility
  neotree.execute({ toggle = true, dir = vim.loop.cwd() })
end

return M
