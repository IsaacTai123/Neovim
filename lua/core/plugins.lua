-- Use :Lazy to open Lazy.nvim UI
-- :Lazy update to update plugins

-- [[ Install `lazy.nvim` plugin manager ]]
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
-- This piece of code is a bootstrapping script that automatically installs lazy.nvim. The first time you launch Neovim, it checks if lazy.nvim exists, and if not, it clones it from GitHub.
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

-- [[Add the path to lazy.nvim at the beginning of the runtimepath]]
-- Neovim searches runtimepath in order. By adding Lazy.nvim to the front, you make sure it loads first — this avoids conflicts or not finding it.
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({

  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter", -- Load plugins automatically after Neovim startup is completed 
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
      -- require("core.plugin_config.telescope")
      local ok, err = pcall(require, "core.plugin_config.telescope")
      if not ok then
        vim.notify("Failed to load telescope config: " .. err, vim.log.levels.ERROR)
      end
    end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      "saghen/blink.cmp",
    },
    config = function()
      require("core.lsp.init")
    end,
  },
  
  -- { "jose-elias-alvarez/typescript.nvim" },

  -- WhichKey
  { 
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("core.plugin_config.whichkey")
    end
  },

  -- UI Enhancements
  { "bluz71/vim-nightfly-guicolors" },
  { "ellisonleao/gruvbox.nvim" },
  { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  { "nvim-lualine/lualine.nvim" },
  { "fgheng/winbar.nvim" },
  { "mhinz/vim-startify" },

  -- File Explorer
  { "nvim-tree/nvim-tree.lua" },

  -- Syntax and Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  

  -- Terminal
  { "voldikss/vim-floaterm" },

  -- Motion Plugins
  { "easymotion/vim-easymotion" },
  -- { "justinmk/vim-sneak" },

  -- Text Editing
  { "tpope/vim-surround" },
  { "tpope/vim-commentary" },
  { "jiangmiao/auto-pairs" },
  { "airblade/vim-gitgutter" },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "onsails/lspkind.nvim" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },

  -- GoLang
  { "fatih/vim-go" },

  -- Productivity
  { "ThePrimeagen/harpoon" },
  { "mbbill/undotree" },

  -- TODO Comments
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Git Tools
  { "akinsho/git-conflict.nvim" },
  { "sindrets/diffview.nvim" },
  { "NeogitOrg/neogit" },

  -- Writing
  { "Pocco81/true-zen.nvim" },

  -- Copilot
  { "github/copilot.vim" },

  -- UI Icons
  { "echasnovski/mini.icons" },
})
