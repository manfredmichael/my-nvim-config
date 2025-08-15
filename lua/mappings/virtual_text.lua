-- Create a variable to track the current state of virtual text
local virtual_text_enabled = true

-- Function to toggle virtual text for diagnostics
function ToggleDiagnosticsVirtualText()
	virtual_text_enabled = not virtual_text_enabled
	-- vim.diagnostic.config({
	--     virtual_text = virtual_text_enabled
	-- })
	vim.diagnostic.config({
		virtual_text = virtual_text_enabled,
		float = {
			border = "single",
		},
		jump = {
			float = false,
			wrap = true,
		},
		severity_sort = false,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "󰅙", -- Your error icon
				[vim.diagnostic.severity.WARN] = "⚠", -- Your warning icon
				[vim.diagnostic.severity.INFO] = "󰋼", -- Your info icon
				[vim.diagnostic.severity.HINT] = "󰌵", -- Your hint icon
			},
		},
		underline = true,
		update_in_insert = false,
		virtual_lines = false,
	})
	if virtual_text_enabled then
		print("Virtual text enabled")
	else
		print("Virtual text disabled")
	end
end

-- Set keybinding for toggling virtual text
vim.api.nvim_set_keymap("n", "<leader>ww", ":lua ToggleDiagnosticsVirtualText()<CR>", { noremap = true, silent = true })
