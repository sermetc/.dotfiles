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
vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = false,
                },
                mccabe = {
                    enabled = false,
                },
                pylint = {
                    enabled = false,
                    args = {"--disable=unused-import"}
                },
                pyflakes = {enabled = false},
                flake8 = {
                    enabled = true,
                    ignore = {
                        "F401",
                        "E226",
                        "E501",
                        "W605",
                        "E731",
                        "W291",
                        "E111",
                        "E117",
                        "E261",
                        "E128",
                        "E126",
                        }
                }
            }
        }
    }
})
vim.lsp.config("texlab", {})
vim.lsp.config("lua_ls", {})
lsp.setup()

