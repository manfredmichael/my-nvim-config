vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "


-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)


-- require("neo-tree")
require('telescope')
require('harpoon')
require('oil')
require('hologram')
require('pets')


-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
-- require "lua.chadrc"
-- require "lua.mappings"

-- Automatically open NeoTree and then Nvdash
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         -- Open NeoTree first (since it's not lazy loaded, it runs automatically)
--         -- vim.cmd("Neotree")
--
--         -- If without delay 
--         vim.cmd("Nvdash")
--         -- -- Delay the opening of Nvdash to ensure it appears after NeoTree
--         -- vim.defer_fn(function()
--         --     -- Switch to Nvdash after NeoTree
--         --     vim.cmd("Nvdash")
--         -- end, 50) -- Adjust delay if needed
--     end
-- })
-- Safe auto-startup for nvdash (add this to your init.lua)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Only show dashboard if no files were opened and buffer is empty
    if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" and vim.bo.filetype == "" then
      vim.schedule(function()
        vim.defer_fn(function()
          -- Safety check: ensure we're still in the right state
          if vim.api.nvim_buf_get_name(0) == "" and vim.bo.filetype == "" then
            local success, _ = pcall(function()
              -- Use vim.cmd to safely call nvdash
              vim.cmd("Nvdash")
            end)
            
            if not success then
              -- Fallback: try again in a moment
              vim.defer_fn(function()
                pcall(vim.cmd, "Nvdash")
              end, 50)
            end
          end
        end, 200) -- Wait 200ms for all plugins to fully load
      end)
    end
  end,
})

local map = vim.keymap.set


-- Toggle relative number
map("n", "<leader>n", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative number" })

vim.schedule(function()
  require "mappings"
end)
