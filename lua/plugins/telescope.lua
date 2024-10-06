return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					respect_gitignore = false,
					file_ignore_patterns = { "node_modules", "build", "^.git/" },
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--no-ignore",
							"-g",
							"!.git/",
							"-g",
							"!tmp/",
							"--glob",
							"*",
							"--glob",
							".env*",
							"--glob",
							".env.template",
							"-u",
						},
					},
				},
				opts = {
					sorting_strategy = "ascending",
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
