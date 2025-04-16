local set = vim.opt 
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

vim.api.nvim_set_option("clipboard", "unnamedplus")
-- for a fast replace
vim.api.nvim_set_keymap('v', '<C-s>', 'y:%s/<C-r>"/', { noremap = true, silent = true });


-- Go to definition (standard LSP uses <C-]>, use Coc's version)
vim.keymap.set('n', '<C-]>', '<Plug>(coc-definition)', { silent = true })

-- Hover docs (standard is `K`)
vim.keymap.set('n', 'K', ':call CocActionAsync("doHover")<CR>', { silent = true })

-- Diagnostics navigation (like `[d`, `]d`)
--vim.keymap.set('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true })
--vim.keymap.set('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true })
--
---- Show diagnostic in float (like `<C-W>d`)
--vim.keymap.set('n', '<C-w>d', ':call CocActionAsync("diagnosticInfo")<CR>', { silent = true })


--vim.api.nvim_set_keymap('n', '<C-\'>', [[:<C-u>CocCommand tsserver.goToSourceDefinition<CR>]], { noremap = true, silent = true })

vim.keymap.set('v', "<C-'>", function()
  -- Yank the selected text
  vim.cmd('normal! "vy')
  -- Prompt the user for how many lines after the current one to include
  local input = vim.fn.input("Lines after current line to include: ")
  local count = tonumber(input) or 0
  -- Get the yanked text
  local search = vim.fn.getreg("v")
  -- Escape any special characters in the search string
  search = vim.fn.escape(search, '\\/.*$^~[]')
  -- Construct and run the substitute command
  local replacement = vim.fn.input("Replacement: ")
  local cmd = string.format(".,.+%ds/%s/%s/g", count, search, replacement)

  -- local cmd = string.format(".,.+%ds/%s//g", count, search)
--   vim.cmd("normal! gv") -- reselect the visual block
--   vim.cmd(":'<,'>s/" .. search .. "//g") -- open default for context
  vim.cmd(cmd)
end, { noremap = true, silent = true, desc = "Substitute yanked text over N lines" })

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
-- vim.api.nvim_set_keymap('n', 'zz', '<C-d>', { noremap = true, silent = true });
-- vim.api.nvim_set_keymap('n', 'zx', '<C-u>', { noremap = true, silent = true });
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
