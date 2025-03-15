require("keymaps");

local lspconfig = require('lspconfig')
local null_ls = require("null-ls")

local on_attach = function(client, bufnr)
    local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint.with({extra_args = { "--no-warn-ignored" } }),
        -- null_ls.builtins.completion.spell,
    },
    on_attach = on_attach,
})

lspconfig.pyright.setup({})

lspconfig.ts_ls.setup({
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
})


