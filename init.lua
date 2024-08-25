local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
vim.api.nvim_set_option("clipboard", "unnamedplus")
-- for a fast replace
vim.api.nvim_set_keymap('v', '<C-s>', 'y:%s/<C-r>"/', { noremap = true, silent = true });
-- for tex editing
vim.api.nvim_set_keymap('v', '<C-i>', 's\\textit{<Esc>pa}<Esc>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('v', '<S-f>', 's\\texttt{<Esc>pa}<Esc>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('v', '<C-k>', 's«<Esc>pa»<Esc>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-a>', ':lua vim.diagnostic.open_float()<Enter>', { noremap = true, silent = true });

local lspconfig = require('lspconfig')

local go_on_attach = function(client, bufnr)
  local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
  })
end

lspconfig.gopls.setup {on_attach=go_on_attach}

local on_attach = function(client, bufnr)
  local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      -- Save the current cursor position
      local cursor_pos = vim.api.nvim_win_get_cursor(0)

      -- Execute Prettier command
      vim.cmd("%!prettier --no-config --single-quote --trailing-comma all --stdin-filepath " .. vim.fn.shellescape(vim.api.nvim_buf_get_name(0)))

      -- Restore the cursor position
      vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
  })
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
}
