return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.fourmolu,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.clang_check,
			},
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format File" })
	end,
}
