local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local servers = {"bashls","sumneko_lua", "clangd", "cmake" , "rls"} -- , "dartls"
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {debounce_text_changes = 150}
     }
end


local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end


require'lspconfig'.clangd.setup {}
require'lspconfig'.cmake.setup {}
require'lspconfig'.jedi_language_server.setup{
  cmd = {
	"jedi-language-server"
  },
  filetypes={
	"python"
  }
}
require'lspconfig'.sumneko_lua.setup{}
-- require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }
require'lspconfig'.bashls.setup{}
-- require'lspconfig'.dartls.setup{}
-- require'lspconfig'.rls.setup{}

