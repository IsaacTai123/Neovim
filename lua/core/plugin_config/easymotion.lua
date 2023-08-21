-- <Leader>f{char} to move to {char}
vim.keymap.set('n', 'f', '<Plug>(easymotion-bd-f)')
vim.keymap.set('n', 'f', '<Plug>(easymotion-overwin-f)')

-- s{char}{char} to move to {char}{char}
vim.keymap.set('n', 's', '<Plug>(easymotion-overwin-f2)')

-- Move to line
vim.keymap.set('n', '<Leader>l', '<Plug>(easymotion-bd-jk)')
vim.keymap.set('n', '<Leader>l', '<Plug>(easymotion-overwin-line)')

-- Move to word
vim.keymap.set('n', '<Leader>w', '<Plug>(easymotion-bd-w)')
vim.keymap.set('n', '<Leader>w', '<Plug>(easymotion-overwin-w)')

-- Gif config
vim.keymap.set('n', '/', '<Plug>(easymotion-sn)')
vim.keymap.set('v', '/', '<Plug>(easymotion-sn)')
vim.keymap.set('o', '/', '<Plug>(easymotion-tn)')

-- These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
-- Without these mappings, `n` & `N` works fine. (These mappings just provide
-- different highlight method and have some other features )
vim.keymap.set('n', 'n', '<Plug>(easymotion-next)')
vim.keymap.set('v', 'n', '<Plug>(easymotion-next)')
vim.keymap.set('n', 'N', '<Plug>(easymotion-prev)')
vim.keymap.set('v', 'N', '<Plug>(easymotion-prev)')
