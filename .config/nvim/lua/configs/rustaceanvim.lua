local on_attach = require("configs.lsp").on_attach
local on_init = require("configs.lsp").on_init
local capabilities = require("configs.lsp").capabilities

vim.g.rustaceanvim = {
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		on_init = on_init,
	},
}
