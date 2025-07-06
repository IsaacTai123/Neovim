local helper = require("core.helper")
local gitsigns = helper.safe_require("gitsigns")

gitsigns.setup({
	on_attach = function(bufnr)
		local gitsigns = require('gitsigns')
	
		local function map(mode, l, r, desc, opts)
		  opts = opts or {}
			opts.desc = desc
		  opts.buffer = bufnr
		  vim.keymap.set(mode, l, r, opts)
		end
	
		-- Navigation
		map('n', ']c', function()
		  if vim.wo.diff then
			vim.cmd.normal({']c', bang = true})
		  else
			gitsigns.nav_hunk('next')
		  end
		end)
	
		map('n', '[c', function()
		  if vim.wo.diff then
			vim.cmd.normal({'[c', bang = true})
		  else
			gitsigns.nav_hunk('prev')
		  end
		end)
	
		-- Actions
		map('n', '<leader>hs', gitsigns.stage_hunk, "Stage Hunk")
		map('n', '<leader>hr', gitsigns.reset_hunk, "Reset Hunk")
	
		map('v', '<leader>hs', function()
		  gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
		end, "Stage Hunk (v)")
	
		-- Revert the current hunk to the last committed version.
		map('v', '<leader>hr', function()
		  gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
		end, "Reset Hunk (v)")
	
		map('n', '<leader>hS', gitsigns.stage_buffer, "Stage Buffer")
		map('n', '<leader>hR', gitsigns.reset_buffer, "Reset Buffer") -- Revert all changes in the current file
		map('n', '<leader>hp', gitsigns.preview_hunk, "Preview Hunk")
		map('n', '<leader>hi', gitsigns.preview_hunk_inline, "Inline Preview Hunk") -- Show the diff of the current hunk directly in the buffer (inline).
	
		-- Same as running git blame in terminal
		map('n', '<leader>hb', function()
		  gitsigns.blame_line({ full = true })
		end, "Blame Line")
	
		map('n', '<leader>hd', gitsigns.diffthis, "Diff HEAD")
	
		map('n', '<leader>hD', function()
		  gitsigns.diffthis('~')
		end, "Diff Previous Commit")
	
		map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, "Set Quickfix (All Hunks)")
		map('n', '<leader>hq', gitsigns.setqflist, "Set Quickfix (Changed Hunks)")
	
		-- Toggles
		map('n', '<leader>htb', gitsigns.toggle_current_line_blame, "Toggle Line Blame")
		map('n', '<leader>htw', gitsigns.toggle_word_diff, "Toggle Word Diff")
	
		-- Text object (Select the current hunk as a text object (e.g., dih to delete the hunk, vih to visually select it).
		map({'o', 'x'}, 'ih', gitsigns.select_hunk, "Inner Hunk")
	  end
})