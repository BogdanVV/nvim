return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim", -- eslint
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({ name = "stylua" }),
				null_ls.builtins.formatting.prettier.with({ name = "prettier" }),
				require("none-ls.diagnostics.eslint_d").with({ name = "eslint" }),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

		vim.g["prettier#autoformat_require_pragma"] = 0
		vim.g["prettier#autoformat_config_present"] = 1
	end,
}
