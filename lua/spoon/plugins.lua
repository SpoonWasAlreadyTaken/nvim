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
    'nvim-telescope/telescope.nvim',
        branch = 'master',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install',
    },
    {
        'nvim-tree/nvim-web-devicons',
        opts = {},
    },

    {
	'EdenEast/nightfox.nvim',
        lazy = false,
	    config = function()
            require("nightfox").setup({})
		    vim.cmd('colorscheme duskfox')
	    end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local config = require('nvim-treesitter.config')
            local treesitter = require('nvim-treesitter')

            local ensure_installed = { 'cpp', 'c', 'c_sharp', 'lua', 'vim', 'vimdoc', 'bash', 'markdown', 'markdown_inline' }
            local already_installed = config.get_installed()
            local to_install = {}

            for _, parser in ipairs(ensure_installed) do
                if not vim.tbl_contains(already_installed, parser) then
                    table.insert(to_install, parser)
                end
            end

            if #to_install > 0 then
                treesitter.install(to_install)
            end

            local group = vim.api.nvim_create_augroup('TreesitterConfig', { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
                group = group,
                callback = function(args)
                    if vim.bo[args.buf].buftype ~= "" then
                        return
                    end
                    if vim.bo[args.buf].filetype == "" then
                        return
                    end

                    if not vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)) then
                        treesitter.install(vim.bo[args.buf].filetype)
                    end
                    if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)) then
                        vim.treesitter.start(args.buf)
                    end
                end,
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
