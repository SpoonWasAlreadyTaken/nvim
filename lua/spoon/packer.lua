-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	    -- or                            , branch = '0.1.x',
  	    requires = { {'nvim-lua/plenary.nvim'} }
      }

    use({
	    'EdenEast/nightfox.nvim',
	    config = function()
            require("nightfox").setup({})
		    vim.cmd('colorscheme duskfox')
	    end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    use({
        'theprimeagen/harpoon',
        branch = "harpoon2",
        requires = { {'nvim-lua/plenary.nvim'} }
    })

    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use('neovim/nvim-lspconfig')

  end)
