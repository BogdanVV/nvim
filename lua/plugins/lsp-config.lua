return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				opts = {
					ensure_installed = {
						"eslint-lsp",
						"typescript-language-server",
						"prettier",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"tsserver",
					"eslint",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		-- dependencies = {
		-- 	"jose-elias-alvarez/typescript.nvim",
		-- 	init = function()
		-- 		require("lazyvim.util").lsp.on_attach(function(_, buffer)
  --         -- stylua: ignore
  --         vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
		-- 			vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
		-- 		end)
		-- 	end,
		-- },
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- tsserver will be automatically installed with mason and loaded with lspconfig
				tsserver = {},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
			setup = {
				-- example to setup with typescript.nvim
				tsserver = function(_, opts)
					require("typescript").setup({ server = opts })
					return true
				end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			-- local on_attach = lspconfig.on_attach

			-- Configure diagnostic display
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●", -- Could be '■', '▎', 'x'
					source = "if_many",
				},
				float = {
					source = "always", -- This will show the source in the hover window
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			-- Customize how diagnostics are displayed
			local function on_attach(client, bufnr)
				-- Your existing on_attach logic here
			end

			lspconfig.eslint.setup({
				on_attach = on_attach,
				settings = {
					workingDirectory = { mode = "auto" },
					format = { enable = true },
					lint = { enable = true },
				},
				root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.js", ".eslintrc.json"),
			})
			lspconfig.tsserver.setup({
				on_attach = on_attach,
				root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
