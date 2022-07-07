
local lspconfig = require'lspconfig'
local signature = require'lsp_signature'
local cmp_nvim_lsp = require'cmp_nvim_lsp'

lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  {
    -- Required by nvim-cmp
    capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),

    -- Init signature plugin on_attach
    on_attach = function ()
      signature.on_attach({
        bind = true,
        handler_opts = {
          border = "single"
        }
      })
    end
  }
)
lspconfig.clangd.setup{}
lspconfig.bashls.setup{}
