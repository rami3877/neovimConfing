local M = {}
function Map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    local stat, error = pcall(vim.api.nvim_set_keymap, mode, lhs, rhs, options)
    if not stat then print(error) end
end
vim.g.mapleader = " "
Map('n', '<Leader>s1', ':HopChar1<CR>')
Map('v', '<Leader>s1', ':HopChar1<CR>')
Map('n', '<Leader>s2', ':HopChar2<CR>')
Map('v', '<Leader>s2', ':HopChar2<CR>')
-- Map('n', '<Leader>', ':HopWord<CR>')
Map('n', '<Leader>sl', ':HopLine<CR>')

Map('n', '<leader>ff', [[<cmd>Telescope find_files<cr>]])
-- Map('n', '<leader>fp', [[<cmd>Telescope media_files<cr>]])
Map('n', '<leader>fg', [[<cmd>Telescope live_grep<cr>]])
Map('n', '<leader>fb', [[<cmd>Telescope buffers<cr>]])
Map('n', '<leader>fh', [[<cmd>Telescope help_tags<cr>]])
Map('n', '<leader>fm', ':Neoformat<CR>')

-- lsp
Map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
-- Map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
Map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
Map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
Map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
Map('n', '<leader>wa','<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
Map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
Map('n', '<leader>wl','<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
Map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
Map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
Map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
Map('n', 'gd', '<cmd>lua vim.lsp.buf.references()<CR>')
Map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
Map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>' )
Map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
Map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
-- Map('n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>')



Map("n", "<leader>tc", "<cmd>TroubleToggle<cr>")



-- save
Map('n', '<C-s>', ':bufdo w <CR>')
-- Map('i', '<C-z>', '')
-- Map('v', '<C-z>', '')

Map("n", "tt", ":NvimTreeToggle<CR>")
Map("n", "tr", ":NvimTreeRefresh<CR>")

-- Map("n", "<A-up>",      ":res +5<CR>")
-- Map("n", "<A-down>",    ":res -5<CR>")
-- Map("n", "<A-left>",    ":vertical resize-5<CR>")
-- Map("n", "<A-right>",   ":vertical resize+5<CR>")
Map("n", "<A-k>", ":res +5<CR>")
Map("n", "<A-j>", ":res -5<CR>")
Map("n", "<A-l>", ":vertical resize-5<CR>")
Map("n", "<A-h>", ":vertical resize+5<CR>")
Map('n', "<leader>fc", ":CommentToggle<CR>")
Map('v', "<leader>fc", ":CommentToggle<CR>")
-- Map('n', "<C-z>", "gg<S-v>Gy<C-o>")
Map('n','<F6>',':!make && make u <CR>')
Map('n','<F5>',':!make run <CR>')
Map('n','<F7>',':!make clear<CR>')
-- force map
Map('n', '<leader>vf',':TZFocus<CR>')

