local helper = require("core.helper")
local toggleterm = helper.safe_require("toggleterm")
local Terminal = helper.safe_require('toggleterm.terminal').Terminal

toggleterm.setup({
  
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

---

-- helper function
local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  desc = desc and ('Term: ' .. desc) or nil
  vim.keymap.set(mode, keys, func, { desc = 'Term: ' .. desc })
end

map("<leader>tb", "<cmd>ToggleTerm<CR>", "[T]oggle Term")

-- Custom term
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  float_opts = {
    border = "double",
  },
  hidden = true,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

map('<leader>tg', function() lazygit:toggle() end, "[T]oggle LazyGit")
