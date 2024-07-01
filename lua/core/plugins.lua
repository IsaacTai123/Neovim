local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- color scheme
  use 'bluz71/vim-nightfly-guicolors'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim'} }
  }
  use 'voldikss/vim-floaterm'
  -- Lua
  use "folke/which-key.nvim"

  -- move cursor
  use "easymotion/vim-easymotion"
  -- use "justinmk/vim-sneak"

  use "tpope/vim-surround"
  use "airblade/vim-gitgutter"

  -- Autocompletion
  use "hrsh7th/nvim-cmp" -- Auto completion engine plugin for nvim
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path" -- auto completion when it comes to path
  use "onsails/lspkind.nvim" -- add vscode like icons to autocompletion

  -- snippets
  use "L3MON4D3/LuaSnip" -- snip engine
  use "saadparwaiz1/cmp_luasnip" -- allow nvim-cmp to show autocompletion
  use "rafamadriz/friendly-snippets" -- a lot of useful snippet for a lot of language

  -- managing & installing LSP servers
  use "williamboman/mason.nvim" -- lsp is built in neovim, but the lsp server need to be install
  use "williamboman/mason-lspconfig.nvim" -- the bridge for mason and nvim-lspconfig

  -- Configuring lsp servers
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp" -- configure lsp server so that they appear in autocompletion
  use {
    "glepnir/lspsaga.nvim",
    branch = "main"
  } -- add enhance UI to LSP experience

  use "jose-elias-alvarez/typescript.nvim" -- add more functionality to typescript server

  -- GoLang
  use "fatih/vim-go"

  -- Comment
  use "tpope/vim-commentary"

  use 'fgheng/winbar.nvim'
  use 'mhinz/vim-startify'
  use 'jiangmiao/auto-pairs'

  use 'mbbill/undotree'
  use 'ThePrimeagen/harpoon'

  use {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  }

  -- Git Conflict
  use { 'akinsho/git-conflict.nvim', tag = "*" }
  use "sindrets/diffview.nvim"
  use "NeogitOrg/neogit"

  -- View
  use { "Pocco81/true-zen.nvim" }

  -- Copilot
  use 'github/copilot.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
