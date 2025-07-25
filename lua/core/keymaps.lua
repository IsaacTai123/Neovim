vim.keymap.set('n', '<Enter>', ':nohlsearch<Enter>')

-- Disable arrow keys
vim.keymap.set('n', '<UP>', '<NOP>', { silent = true })
vim.keymap.set('n', '<DOWN>', '<NOP>', { silent = true })
vim.keymap.set('n', '<LEFT>', '<NOP>', { silent = true })
vim.keymap.set('n', '<RIGHT>', '<NOP>', { silent = true })
vim.keymap.set('i', '<UP>', '<NOP>', { silent = true })
vim.keymap.set('i', '<DOWN>', '<NOP>', { silent = true })
vim.keymap.set('i', '<LEFT>', '<NOP>', { silent = true })
vim.keymap.set('i', '<RIGHT>', '<NOP>', { silent = true })

-- Remap some keys for easy access
vim.keymap.set('i', 'jk', '<Esc>', { silent = true })
vim.keymap.set('i', 'jj', '<Esc>', { silent = true })
vim.keymap.set('n', ',s', ':w<CR>', { silent = true, desc = 'Save the file' })
vim.keymap.set('n', 'H', '^', { silent = true })
vim.keymap.set('n', 'L', '$', { silent = true })
vim.keymap.set('i', '<C-e>;', '<end>;<CR>', { silent = true })
vim.keymap.set('i', '<C-e>.', '<end>.', { silent = true })
vim.keymap.set('i', '<C-b>;', '<esc>][i<end>;<CR>', { silent = true })
vim.keymap.set('i', '<C-b>.', '<esc>][i<end>.', { silent = true })
vim.keymap.set('n', '<M-l>', '<C-w>2<', { silent = true })
vim.keymap.set('n', '<M-h>', '<C-w>2>', { silent = true })
vim.keymap.set('n', '<M-k>', '<C-w>2+', { silent = true })
vim.keymap.set('n', '<M-j>', '<C-w>2-', { silent = true })
vim.keymap.set('n', '<C-J>', [[<Cmd>wincmd j<CR>]], { silent = true })
vim.keymap.set('n', '<C-K>', [[<Cmd>wincmd k<CR>]], { silent = true })
vim.keymap.set('n', '<C-L>', [[<Cmd>wincmd l<CR>]], { silent = true })
vim.keymap.set('n', '<C-H>', [[<Cmd>wincmd h<CR>]], { silent = true })
-- vim.keymap.set('n', '<M-v>', '<C-W>v', { silent = true })
-- vim.keymap.set('n', '<M-s>', '<C-W>s', { silent = true })
vim.keymap.set('n', 'Q', ':q<CR>', { silent = true })
vim.keymap.set('n', 'XX', ':lua QuitVim()<CR>', { silent = true })
-- vim.keymap.set('v', '<C-c>', '"*y:let @+=@*<CR>', { silent = true }) -- This ensures the copied text is available in both * and + registers.
vim.keymap.set('n', '<Leader>b', ':bd<CR>:bn<CR>', { silent = true, desc = 'Close cur Buf go to next' }) -- close the current buffer and then enter the first opened buffer

-- Function written in Lua
function QuitVim()
  local choice = vim.fn.confirm("This will Exit out Neovim without saving are you sure ?", "&yes\n&no", 1)
  if choice == 1 then
    vim.cmd("qa!")
    vim.api.nvim_echo({{"Good Luck !", "MoreMsg"}}, true, {})
  else
    vim.api.nvim_echo({{"Action canceled !", "WarningMsg"}}, true, {})
  end
end
