local set = vim.opt 
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
vim.api.nvim_set_option("clipboard", "unnamedplus")
-- for a fast replace
vim.api.nvim_set_keymap('v', '<C-s>', 'y:%s/<C-r>"/', { noremap = true, silent = true });
-- for a quick delete-copy-to-file action
-- vim.api.nvim_set_keymap('v', '<C-r>', ':d a | new | put a | w >> ../ambient.d.ts | q! | redraw', { noremap = true, silent = true });
vim.api.nvim_set_keymap('v', '<C-r>', 
    ":d a | new | put a | execute 'w >> ' . input('Filename: ') | q! | redraw<CR>", 
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap('v', '<M-r>', 
    ":d a | new | put a | execute 'w ' . input('Filename: ') | q! | redraw<CR>", 
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n", 
  "<C-w>", 
  ":!eslint --fix %<CR>:e<CR>", 
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap('n', 'zz', '<C-d>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', 'zx', '<C-u>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-a>', ':lua vim.diagnostic.open_float()<Enter>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-k>', [[:lua OpenKittyHere()<CR>]], { noremap = true, silent = true })

function OpenKittyHere()
  local cwd = vim.fn.getcwd()
  vim.fn.jobstart({ "kitty", "--directory", cwd }, { detach = true })
end
-- for tex editing (not needed atm)
-- vim.api.nvim_set_keymap('v', '<C-i>', 's\\textit{<Esc>pa}<Esc>', { noremap = true, silent = true });
-- vim.api.nvim_set_keymap('v', '<S-f>', 's\\texttt{<Esc>pa}<Esc>', { noremap = true, silent = true });
-- vim.api.nvim_set_keymap('v', '<C-k>', 's«<Esc>pa»<Esc>', { noremap = true, silent = true });
