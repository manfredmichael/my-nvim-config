-- Create a variable to track the current state of virtual text
local virtual_text_enabled = true

-- Function to toggle virtual text for diagnostics
function ToggleDiagnosticsVirtualText()
    virtual_text_enabled = not virtual_text_enabled
    vim.diagnostic.config({
        virtual_text = virtual_text_enabled
    })
    if virtual_text_enabled then
        print("Virtual text enabled")
    else
        print("Virtual text disabled")
    end
end

-- Set keybinding for toggling virtual text
vim.api.nvim_set_keymap('n', '<leader>ww', ':lua ToggleDiagnosticsVirtualText()<CR>', { noremap = true, silent = true })

