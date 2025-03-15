vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use {'wbthomason/packer.nvim'}

    use {'jose-elias-alvarez/null-ls.nvim'}

    use {'nvim-lua/plenary.nvim'}  -- Required by null-ls
end)
