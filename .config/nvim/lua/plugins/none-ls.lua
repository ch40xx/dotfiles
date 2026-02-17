return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},

	config = function()

    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua",
        "prettier",
        "eslint_d",
    "ruff",
    "rubocop",
    "shfmt",},
    automatic_installation = true,
    })

		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,
				-- javascript, typescript
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.prettier,
				-- python
				require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
				require("none-ls.formatting.ruff_format"),
				-- ruby
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,
				-- shell
				null_ls.builtins.formatting.shfmt.with({ args = { "-i", "4" } }),
			},

			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
