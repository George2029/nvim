require("keymaps");
require("config.lazy")

-- local lspconfig = require('lspconfig')
 -- local null_ls = require("null-ls")

--local on_attach = function(client, bufnr)
--    local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
--
--    if client.supports_method("textDocument/formatting") then
--        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--        vim.api.nvim_create_autocmd("BufWritePre", {
--            group = augroup,
--            buffer = bufnr,
--            callback = function()
--                vim.lsp.buf.format()
--            end,
--        })
--    end
--end

-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.prettier,
--         null_ls.builtins.diagnostics.eslint,
--     },
-- })

-- lspconfig.pyright.setup({})
-- 
-- lspconfig.ts_ls.setup({})

-- lspconfig.rust_analyzer.setup({
--     on_attach = on_attach,
--     settings = {
--         ["rust-analyzer"] = {
--             cargo = { allFeatures = true },
--             checkOnSave = {
--                 command = "clippy", -- Use Clippy for linting
--             },
--         },
--     },
-- })

--   bufnr = bufnr,
   -- This ensures that only null-ls formats your code
--   filter = function(client)
--       return client.name == "null-ls"
--   end,


