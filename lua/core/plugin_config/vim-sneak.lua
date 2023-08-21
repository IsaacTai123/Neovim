-- Enable `vim-sneak` plugin
-- vim.g['sneak#s_next'] = 1
vim.g.sneak_s_next = 1

-- Configure the keybindings for `vim-sneak`
vim.api.nvim_set_keymap('n', 'f', '<Plug>Sneak_f', {})
vim.api.nvim_set_keymap('n', 'F', '<Plug>Sneak_F', {})
vim.api.nvim_set_keymap('n', 't', '<Plug>Sneak_t', {})
vim.api.nvim_set_keymap('n', 'T', '<Plug>Sneak_T', {})
