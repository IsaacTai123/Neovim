-- Key mapping
vim.g.mapleader = " " -- map <Space> as leader key
vim.g.maplocalleader = " "

-- Appearance
vim.opt.cmdheight = 1
vim.opt.relativenumber = true
vim.g.have_nerd_font = true

vim.opt.showmode = false
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

vim.opt.shiftround = true --  aligns the indentation to the nearest multiple of shiftwidth when using >> and << commands

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

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true