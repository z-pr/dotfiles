return {
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "\\", ":Neotree toggle<CR>", { desc = "NeoTree toggle" } },
		},
		opts = {
			filesystem = {
				window = {
					mappings = {
						["\\"] = "close_window",
					},
				},
			},
		},
	},
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>f"] = { name = "[F]ile", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
				["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
				["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
				["<leader>u"] = { name = "[U]i", _ = "which_key_ignore" },
			})
			-- visual mode
			require("which-key").register({
				["<leader>h"] = { "Git [H]unk" },
			}, { mode = "v" })
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			vim.cmd("colorscheme carbonfox")
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"andymass/vim-matchup",
		config = function()
			require("nvim-treesitter.configs").setup({
				endwise = {
					enable = true,
				},
			})
		end,
	},
	{
		"RRethy/nvim-treesitter-endwise",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "ruby", "eruby", "vim", "lua", "bash" },
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				endwise = {
					enable = true,
				},
			})
		end,
	},
	{
		"mrjones2014/smart-splits.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"dkarter/bullets.vim",
		ft = { "markdown", "text" },
		config = function()
			vim.g["bullets_set_mappings"] = 0
		end,
	},
	{
		-- markdown preview
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]() -- install without yarn or npm
		end,
		cmd = { "MarkdownPreview" },
		ft = "markdown",
	},
	{
		"NvChad/nvim-colorizer.lua",
		ft = { "css", "javascript", "vue", "html", "tmux", "lua", "typescript", "html", "templ" },
		config = true,
		opts = {
			user_default_options = {
				names = false,
			},
		},
	},
	-- {
	-- 	"ibhagwan/fzf-lua",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		-- add Rg command to mimic the old Rg
	-- 		vim.api.nvim_create_user_command("Rg", function(opts)
	-- 			require("fzf-lua").grep({ search = opts.args })
	-- 		end, { bang = true, nargs = "?", desc = "Rg command, but from fzf-lua" })
	--
	-- 		local actions = require("fzf-lua.actions")
	-- 		require("fzf-lua").setup({
	-- 			actions = {
	-- 				files = {
	-- 					-- instead of the default action 'actions.file_edit_or_qf'
	-- 					-- it's important to define all other actions here as this
	-- 					-- table does not get merged with the global defaults
	-- 					["default"] = actions.file_edit,
	-- 					["ctrl-s"] = actions.file_split,
	-- 					["ctrl-v"] = actions.file_vsplit,
	-- 					["ctrl-t"] = actions.file_tabedit,
	-- 					["alt-q"] = actions.file_sel_to_qf,
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	--    -- stylua: ignore
	--    keys = {
	--      { "<C-p>"     , "<cmd>FzfLua files<cr>",                                                     desc = "Find files" },
	--      { "<C-b>"     , "<cmd>FzfLua buffers<cr>",                                                   desc = "Find current buffers" },
	--      { "<leader>sw", "<cmd>FzfLua grep<cr>",                                                      desc = "Search for something (using Rg)" },
	--      { "<leader>ss", "<cmd>FzfLua grep_cword<cr>",                                                desc = "Search for current word under cursor" },
	--      -- replacing lazyvim telescope keys with fzf-lua
	--      { "<leader>/" , "<cmd>FzfLua live_grep<cr>",                                                 desc = "Grep" },
	--      { "<leader>:" , "<cmd>FzfLua command_history<cr>",                                           desc = "Command History" },
	--      { "<leader>," , "<cmd>FzfLua files<cr>",                                                     desc = "Find Files" },
	--      -- find
	--      { "<leader>fb", "<cmd>FzfLua buffers<cr>",                                                   desc = "Buffers" },
	--      { "<leader>fc", '<cmd>lua require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })<cr>', desc = "Find Config File", },
	--      { "<leader>ff", "<cmd>FzfLua files<cr>",                                                     desc = "Find files" },
	--      { "<leader>fr", "<cmd>FzfLua oldfiles",                                                      desc = "Recent" },
	--      -- search
	--      { '<leader>s"', "<cmd>FzfLua registers<cr>",                                                 desc = "Registers" },
	--      { "<leader>sa", "<cmd>FzfLua autocmd<cr>",                                                   desc = "Auto Commands" },
	--      { "<leader>sc", "<cmd>FzfLua command_history<cr>",                                           desc = "Command History" },
	--      { "<leader>sC", "<cmd>FzfLua commands<cr>",                                                  desc = "Commands" },
	--      { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>",                                      desc = "Document diagnostics" },
	--      { "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>",                                      desc = "Workspace diagnostics" },
	--      { "<leader>sg", "<cmd>FzfLua grep<cr>",                                                      desc = "Grep" },
	--      { "<leader>sh", "<cmd>FzfLua help_tags<cr>",                                                 desc = "Help Pages" },
	--      { "<leader>sH", "<cmd>FzfLua highlights<cr>",                                                desc = "Search Highlight Groups" },
	--      { "<leader>sk", "<cmd>FzfLua keymaps<cr>",                                                   desc = "Key Maps" },
	--      { "<leader>sM", "<cmd>FzfLua man_pages<cr>",                                                 desc = "Man Pages" },
	--      { "<leader>sm", "<cmd>FzfLua marks<cr>",                                                     desc = "Jump to Mark" },
	--      { "<leader>sR", "<cmd>FzfLua resume<cr>",                                                    desc = "Resume" },
	--      { "<leader>sw", "<cmd>FzfLua grep_cword<cr>",                                                desc = "Word under cursor" },
	--      { "<leader>sw", "<cmd>FzfLua grep_visual<cr>",                                               desc = "Selection", mode = "v"  },
	--      { "<leader>uC", "<cmd>FzfLua colorschemes<cr>",                                              desc = "Colorscheme" },
	--      { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>",                                      desc = "Goto Symbol" },
	--      { "<leader>sS", "<cmd>FzfLua lsp_workspace_symbols<cr>",                                     desc = "Goto Symbol (Workspace)" },
	--    },
	-- },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		-- Optional dependency
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({})
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			{ "SmiteshP/nvim-navic" },
		},
		opts = {
			-- configurations go here
			-- theme = {
			--   normal = { bg = "#f2e9e1" },
			-- },
		},
	},
	{
		"folke/twilight.nvim",
		opts = {},
		cmd = "Twilight",
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			-- Disable virtual_text since it's redundant due to lsp_lines.
			vim.diagnostic.config({
				virtual_text = false,
			})
			require("lsp_lines").setup()
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "carbonfox",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
		},
	},
}
