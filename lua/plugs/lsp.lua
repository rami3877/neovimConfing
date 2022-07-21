local lspOptions

if optionsall.lsp == nil then
	print(" ERRO : cant optionsall.lsp")
	return
else
	lspOptions = optionsall.lsp
end

require("lspconfig").util.default_config = vim.tbl_extend("force", require("lspconfig").util.default_config, {
	-- Required by nvim-cmp
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),

	-- Init signature plugin on_attach
	on_attach = function()
		require("lsp_signature").on_attach({
			bind = true,
			handler_opts = {
				border = "single",
			},
		})
	end,
})

for _, lsp in ipairs(lspOptions.servers) do
	if type(lsp) == "table" and lsp.settings then
		require("lspconfig")[lsp].setup({
		  settings = lsp.settings
		})
	else
		require("lspconfig")[lsp].setup({})
	end
end

for _, sign in ipairs(lspOptions.signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
