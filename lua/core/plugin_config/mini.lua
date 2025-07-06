local helper = require("core.helper")
local mini_ai = helper.safe_require("mini.ai")
local mini_surround = helper.safe_require("mini.surround")
local mini_statusline = helper.safe_require("mini.statusline")

-- Most of the config down bellow are default settings

-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
mini_ai.setup({
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		-- Main textobject prefixes
		around = 'a',
		inside = 'i',
	
		-- Next/last variants
		around_next = 'an',
		inside_next = 'in',
		around_last = 'al',
		inside_last = 'il',
	
		-- Move cursor to corresponding edge of `a` textobject
		goto_left = 'g[',
		goto_right = 'g]',
	  },

	-- Number of lines within which textobject is searched
	n_lines = 500,
})

mini_surround.setup({
	-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
	highlight_duration = 500,

	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
	  add = 'sa', -- Add surrounding in Normal and Visual modes
	  delete = 'sd', -- Delete surrounding
	  find = 'sf', -- Find surrounding (to the right)
	  find_left = 'sF', -- Find surrounding (to the left)
	  highlight = 'sh', -- Highlight surrounding
	  replace = 'sr', -- Replace surrounding
	  update_n_lines = 'sn', -- Update `n_lines`
  
	  suffix_last = 'l', -- Suffix to search with "prev" method
	  suffix_next = 'n', -- Suffix to search with "next" method
	},
  
	-- Number of lines within which surrounding is searched
	n_lines = 20,
})

-- Simple and easy statusline
mini_statusline.setup({
	use_icons = vim.g.have_nerd_font
})