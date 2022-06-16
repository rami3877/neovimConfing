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

local servers = {"sumneko_lua", "clangd", "arduino_language_server", "cmake"}

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

-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--     vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = {prefix = "", spacing = 2},
--         signs = true,
--         underline = true
--     })
--
nvim_lsp.arduino_language_server.setup {

    cmd = {
        "arduino-language-server", "-cli-config",
        "\"$HOME/.arduino15/arduino-cli.yaml\"", "-cli",
        "\"/usr/sbin/arduino-cli\"", "-clangd", "\"/usr/sbin/clangd\"", "-fqbn",
        "arduino:mbed:nanorp2040connect"

    }

}

require'lspconfig'.clangd.setup {

    -- root_pattern = require 'lspconfig.util'.root_pattern('compile_commands.json', 'compile_flags.txt', '.git')
}
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


require("nvim-lsp-installer").setup {}
