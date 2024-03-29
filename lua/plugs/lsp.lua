local lspOptions
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},


})

lspconfig.clangd.setup({})
-- Set up lspconfig.
require'lspconfig'.openscad_lsp.setup{}

require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
})

require'lspconfig'.arduino_language_server.setup{}


require("lspconfig")["openscad_lsp"].setup({
	capabilities = capabilities,
})

require("lspconfig")["arduino_language_server"].setup({
	capabilities = capabilities,
})


require("lspconfig")["clangd"].setup({
	capabilities = capabilities,
})
