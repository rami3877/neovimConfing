

require'lspconfig'.util.default_config = vim.tbl_extend(
  "force",
 require'lspconfig'.util.default_config,
  {
    -- Required by nvim-cmp
    capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities()),

    -- Init signature plugin on_attach
    on_attach = function ()
      require'lsp_signature'.on_attach({
        bind = true,
        handler_opts = {
          border = "single"
        }
      })
    end
  }
)
require'lspconfig'.clangd.setup{}
require'lspconfig'.bashls.setup{}

local signs = {
       { name = "DiagnosticSignError", text = "" },
       { name = "DiagnosticSignWarn", text = "" },
       { name = "DiagnosticSignHint", text = "" },
       { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
       vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
