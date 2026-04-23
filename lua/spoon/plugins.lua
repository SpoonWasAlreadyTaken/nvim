-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
'nvim-lua/plenary.nvim',

{
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

{
	'EdenEast/nightfox.nvim',
	    config = function()
            require("nightfox").setup({})
		    vim.cmd('colorscheme duskfox')
	    end
    },

{
    'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
             require('nvim-treesitter.config').setup({
                ensure_installed = { "cpp", "bash", "c_sharp", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                },
            })
        end,
    },

{
    'theprimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

'mbbill/undotree',
'tpope/vim-fugitive',

'neovim/nvim-lspconfig',

'hrsh7th/nvim-cmp',

'hrsh7th/cmp-nvim-lsp',

'hrsh7th/cmp-buffer',
'hrsh7th/cmp-path',
{
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
    },
'saadparwaiz1/cmp_luasnip',

'onsails/lspkind.nvim',
}

local opts = {}

require("lazy").setup(plugins, opts)
