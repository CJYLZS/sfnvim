-- lspconfig
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local on_attach = function(client) end
		-- python-lsp-server
		lspconfig.pylsp.setup({
			on_attach = on_attach,
		})
	end,
}
