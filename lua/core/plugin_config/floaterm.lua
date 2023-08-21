vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_opener = 'edit'
vim.g.floaterm_wintype = 'float'
vim.g.floaterm_position = 'center'
vim.g.floaterm_autoclose = 1

-- Configuration example

-- key map to toggle floaterm in normal and terminal mode, and terminal back to normal mode
vim.keymap.set("n", "<Leader>t", "<cmd>FloatermToggle<cr>", {noremap = true, silent = true})
vim.keymap.set("t", "<Leader>t", "<cmd>FloatermToggle<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', ',<Esc>', '<C-\\><C-n>', { noremap = true })
-- vim.g.floaterm_keymap_toggle = '<leader>t'  "you can set it with this format either"

-- Set floaterm window's background to black
vim.cmd([[hi Floaterm guibg=black]])
-- Set floating window border line color to cyan, and background to orange
vim.cmd([[hi FloatermBorder guibg=gruvbox guifg=orange]])

-- Set floaterm window foreground to gray once the cursor moves out from it
vim.cmd([[hi FloatermNC guifg=gray]])

-- Hide status line went open floaterm window
vim.cmd([[
  augroup FloatermAutocmds
    autocmd!
    autocmd FileType floaterm set laststatus=0 noshowmode noruler
    autocmd FileType floaterm autocmd BufLeave <buffer> set laststatus=2 showmode ruler
  augroup END
]])
