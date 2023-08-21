vim.opt.termguicolors = true
vim.api.nvim_set_keymap('n', '[b', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']b', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

require("bufferline").setup {
  options = {
    buffer_close_icon = '✗',
    diagnostics = "coc",
  }
}

