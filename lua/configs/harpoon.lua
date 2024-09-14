local M = {}
local harpoon = require('harpoon')

M.setup = function()
    harpoon:setup({})
end

M.harpoon = harpoon

M.get_harpoon_list = function()
  return harpoon:list()
end


-- basic telescope configuration
local conf = require("telescope.config").values
M.toggle_telescope = function(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

return M
