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
require "lua.chadrc"
require "lua.mappings"

-- Automatically open NeoTree and then Nvdash
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Open NeoTree first (since it's not lazy loaded, it runs automatically)
        -- vim.cmd("Neotree")

        -- If without delay 
        vim.cmd("Nvdash")
        -- -- Delay the opening of Nvdash to ensure it appears after NeoTree
        -- vim.defer_fn(function()
        --     -- Switch to Nvdash after NeoTree
        --     vim.cmd("Nvdash")
        -- end, 50) -- Adjust delay if needed
    end
})

vim.schedule(function()
  require "mappings"
end)
