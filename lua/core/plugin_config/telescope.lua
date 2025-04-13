local telescope_status, telescope = pcall(require, 'telescope')

local a = vim.api
local actions = require "telescope.actions"
local config = require "telescope.config"

telescope.setup{
  defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    },
    layout_strategy = 'vertical',
    layout_config = { height = 0.95, width = 0.6 },
    winblend=0 -- transparency
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
}


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-g>', builtin.git_files, {})
