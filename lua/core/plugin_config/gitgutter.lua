vim.g.gitgutter_max_signs = 500
vim.g.gitgutter_max_signs = -1


vim.opt.signcolumn = 'yes'
vim.g.gitgutter_set_sign_backgrounds = 'NONE'
vim.g.gitgutter_sign_modified = 'M'

vim.g.gitgutter_sign_added = '|'
vim.g.gitgutter_sign_modified = '|'
vim.g.gitgutter_sign_removed = '|'
vim.g.gitgutter_sign_modified_removed = 'D'

-- Set SignColumn background to NONE
vim.api.nvim_exec([[
  hi SignColumn guibg='NONE'
]], false)

-- Customize sign colors
vim.cmd([[highlight GitGutterAdd guibg=NONE guifg=#009900 ctermfg=2]])
vim.cmd([[highlight GitGutterChange guibg=NONE guifg=#bbbb00 ctermfg=3]])
vim.cmd([[highlight GitGutterDelete guibg=NONE guifg=#ff2222 ctermfg=1]])

-- 定義 GitGutterLineHighlights 的顏色為亮綠色
vim.cmd([[highlight GitGutterAddLine guifg=NONE guibg=#45544B ]])
vim.cmd([[highlight GitGutterChangeLine guifg=NONE guibg=#bbbb00 ]])
vim.cmd([[highlight GitGutterDeleteLine guifg=NONE guibg=#ff2222 ]])
vim.cmd([[highlight GitGutterChangeDeleteLine guifg=NONE guibg=#91554B ]])


-- Define color in Diff
vim.cmd([[highlight diffAdd guifg=NONE guibg=#45544B ]])
vim.cmd([[highlight diffChange guifg=NONE guibg=#C7B216 ]])
vim.cmd([[highlight diffRemove guifg=NONE guibg=#91554B ]])
