local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    vim.diagnostic.config({
        update_in_insert = true
    })
end)

lsp.preset('recommended')

require('fidget').setup({
    notification = {
        window = {
            winblend = 0
        }
    }
})
require('mason').setup()
require('mason-lspconfig').setup()
require('lspconfig').pylsp.setup({})
require('lspconfig').texlab.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').lua_ls.setup({})

lsp.setup()
