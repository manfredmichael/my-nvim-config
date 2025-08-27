return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"html-lsp",
				"prettier",
				"stylua",
				"gopls",
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			-- cmd = "Neotree",
			lazy = false, -- Ensure Neo-tree loads on startup
			keys = {
				{ "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Neo Tree" },
			},
		},
		config = function()
			require("configs.neotree").setup()
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                              , branch = '0.1.x',
		-- dependencies = { 'nvim-lua/plenary.nvim' },
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			require("configs.telescope").setup()
			-- require('telescope').load_extension('fzf')
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			require("configs.harpoon").setup()
		end,
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("configs.conform").setup()
		end,
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		config = function()
			require("configs.oil").setup()
		end,
	},
	{
		"nvim-focus/focus.nvim",
		version = "*",
		config = function()
			require("configs.focus").setup()
		end,
	},
	{
		"Asheq/close-buffers.vim",
	},
	{ "kevinhwang91/promise-async" },
	{
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
		config = function()
			require("configs.ufo").setup()
		end,
	},
	{
		"tamton-aquib/duck.nvim",
		config = function()
			require("configs.duck").setup()
		end,
	},
	{
		"edluffy/hologram.nvim",
	},
	{
		"giusgad/pets.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
		config = function()
			require("configs.pets").setup()
		end,
	},
	-- {
	--   "yetone/avante.nvim",
	--   event = "verylazy",
	--   lazy = false,
	--   version = false, -- set this if you want to always pull the latest change
	--   opts = {
	--     -- add any opts here
	--   },
	--   -- if you want to build from source then do `make build_from_source=true`
	--   build = "make",
	--   -- build = "powershell -executionpolicy bypass -file build.ps1 -buildfromsource false" -- for windows
	--   dependencies = {
	--     "stevearc/dressing.nvim",
	--     "nvim-lua/plenary.nvim",
	--     "muniftanjim/nui.nvim",
	--     --- the below dependencies are optional,
	--     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
	--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	--     "zbirenbaum/copilot.lua", -- for providers='copilot'
	--     {
	--       -- support for image pasting
	--       "HakonHarnes/img-clip.nvim",
	--       event = "VeryLazy",
	--       opts = {
	--         -- recommended settings
	--         default = {
	--           embed_image_as_base64 = false,
	--           prompt_for_file_name = false,
	--           drag_and_drop = {
	--             insert_mode = true,
	--           },
	--           -- required for Windows users
	--           use_absolute_path = true,
	--         },
	--       },
	--     },
	--     {
	--       -- Make sure to set this up properly if you have lazy=true
	--       "MeanderingProgrammer/render-markdown.nvim",
	--       opts = {
	--         file_types = { "markdown", "Avante" },
	--       },
	--       ft = { "markdown", "Avante" },
	--     },
	--   },
	--   config = function()
	--     require("configs.avante").setup()
	--   end,
	-- },
	{
		"S1M0N38/love2d.nvim",
		cmd = "LoveRun",
		opts = {},
		keys = {
			{ "<leader>v", ft = "lua", desc = "LÖVE" },
			{ "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
			{ "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"python",
			},
		},
	},
	{
		"kiyoon/jupynium.nvim",
		build = "pip3 install --user .",
		-- build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
		-- build = "conda run --no-capture-output -n jupynium pip install .",
		config = function()
			require("configs.jupynium").setup()
			-- require('telescope').load_extension('fzf')
		end,
	},
	{
		"rcarriga/nvim-notify", -- optional
	},
	{
		"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
	},
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<C-\\><C-n>:ClaudeCode<cr>", mode = { "n", "t" }, desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},
}
