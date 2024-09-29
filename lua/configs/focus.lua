local M = {}

M.setup = function()
  require("focus").setup {
    enable = true, -- Enable module
    commands = true, -- Create Focus commands
    autoresize = {
      enable = true, -- Enable or disable auto-resizing of splits
      width = 0, -- Force width for the focused window
      height = 0, -- Force height for the focused window
      minwidth = 0, -- Force minimum width for the unfocused window
      minheight = 0, -- Force minimum height for the unfocused window
      height_quickfix = 10, -- Set the height of quickfix panel
    },
    split = {
      bufnew = false, -- Create blank buffer for new split windows
      tmux = false, -- Create tmux splits instead of neovim splits
    },
    ui = {
      number = false, -- Display line numbers in the focussed window only
      relativenumber = false, -- Display relative line numbers in the focussed window only
      hybridnumber = false, -- Display hybrid line numbers in the focussed window only
      absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

      cursorline = true, -- Display a cursorline in the focussed window only
      cursorcolumn = false, -- Display cursorcolumn in the focussed window only
      colorcolumn = {
        enable = false, -- Display colorcolumn in the foccused window only
        list = "+1", -- Set the comma-saperated list for the colorcolumn
      },
      signcolumn = true, -- Display signcolumn in the focussed window only
      winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
    },
  }
end

-- Create a variable to track the current state of focus
local focus_enabled = true
-- Function to toggle focus
M.toggle = function()
  focus_enabled = not focus_enabled

  if focus_enabled then
    vim.cmd("FocusDisable")
    print "focus.nvim enabled"
  else
    vim.cmd("FocusEnable")
    print "focus.nvim disabled"
  end
end

return M
