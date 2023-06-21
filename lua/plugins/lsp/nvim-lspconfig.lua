-- lspconfig
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local on_attach = function(client, bufnr)
			require("lsp_signature").on_attach(signature_setup, bufnr) -- Note: add in lsp client on-attach
		end
		-- python-lsp-server
		lspconfig.pylsp.setup({
			on_attach = on_attach,
		})
	end,
}
