return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"yaml",
		},
	},
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			-- ensure_installed = { "lua", "javascript", "typescript", "go", "css", "dockerfile", "html", "jsdoc", "json", "make", "python", "rust", "scss", "sql", "styled", "terraform", "xml", "yaml" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
