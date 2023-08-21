-- Key mapping
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Appearance
vim.opt.cmdheight = 1
vim.api.nvim_win_set_option(0, 'number', true)
vim.opt.relativenumber = true

vim.opt.showmode = false
-- vim.api.nvim_command('set noshowmode')
vim.opt.showcmd = true
vim.opt.list = false
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.autoread = true
vim.opt.ruler = true
vim.opt.showtabline = 3
vim.opt.shortmess = 'I'
vim.opt.equalalways = true
vim.opt.statusline = "%F"  -- Show full path in status line
vim.opt.showbreak='↳ '
vim.opt.conceallevel = 0   -- Show `` in markdown file
vim.opt.wildmenu = true
vim.opt.wildmode = 'full,full'
vim.opt.previewheight = 15
vim.opt.pumheight = 6      -- Set pop up windows max height


vim.opt.backspace = '2'
vim.opt.autoread = true
vim.opt.laststatus = 2
-- vim.opt.autowrite = true  -- Auto save changes when you switch to other buffer

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4    -- Set the level indent for ">>", "<<"
vim.opt.shiftround = true --  aligns the indentation to the nearest multiple of shiftwidth when using >> and << commands
vim.opt.expandtab = true

-- Split window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Sound
vim.opt.visualbell = false
vim.opt.errorbells = false   -- Turn off errorbells

-- Configuration
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.clipboard = 'unnamed'
vim.opt.swapfile = false
vim.opt.hidden = true
vim.o.omnifunc = 'syntaxcomplete#Complete'
vim.opt.compatible = false

-- Filetype
-- vim.cmd('filetype on')
-- vim.cmd('filetype indent on')
-- vim.cmd('filetype plugin on')

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
