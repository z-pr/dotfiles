local on_attach = require("configs.lsp").on_attach
local on_init = require("configs.lsp").on_init
local capabilities = require("configs.lsp").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

lspconfig.tsserver.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.mod", "go.work", ".git"),
	settings = {
		gopls = {
			gofumpt = true,
			analyses = {
				unusedparams = true,
				fieldalignment = true,
				useany = true,
			},
			staticcheck = true,
			-- buildFlags = { "-tags=dev prod" },
			semanticTokens = true,
			usePlaceholders = true,
		},
	},
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	filetypes = { "templ", "astro", "javascript", "typescript", "react" },
	init_options = { userLanguages = { templ = "html" } },
})

lspconfig.templ.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
})

lspconfig.html.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	filetypes = { "html", "templ" },
})

lspconfig.htmx.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	filetypes = { "html", "templ" },
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
})
