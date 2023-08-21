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
vim.keymap.set('n', '<Leader>j', 'o<Esc>', { silent = true })
vim.keymap.set('n', '<Leader>k', 'O<Esc>', { silent = true })
vim.keymap.set('n', '<Leader>w', ':wa<CR>', { silent = true })
vim.keymap.set('n', '<Leader>s', ':w<CR>', { silent = true })
vim.keymap.set('n', 'H', '^', { silent = true })
vim.keymap.set('n', 'L', '$', { silent = true })
vim.keymap.set('n', '<Leader>c', 'viw~<CR>', { silent = true })
vim.keymap.set('i', '<C-e>;', '<end>;<CR>', { silent = true })
vim.keymap.set('i', '<C-e>.', '<end>.', { silent = true })
vim.keymap.set('i', '<C-b>;', '<esc>][i<end>;<CR>', { silent = true })
vim.keymap.set('i', '<C-b>.', '<esc>][i<end>.', { silent = true })
vim.keymap.set('n', '<M-l>', '<C-w>2<', { silent = true })
vim.keymap.set('n', '<M-h>', '<C-w>2>', { silent = true })
vim.keymap.set('n', '<M-k>', '<C-w>2+', { silent = true })
vim.keymap.set('n', '<M-j>', '<C-w>2-', { silent = true })
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { silent = true })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { silent = true })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { silent = true })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { silent = true })
vim.keymap.set('n', '<M-v>', '<C-W>v', { silent = true })
vim.keymap.set('n', '<M-s>', '<C-W>s', { silent = true })
vim.keymap.set('n', 'Q', ':q<CR>', { silent = true })
vim.keymap.set('n', 'XX', ':call QuitVim()<CR>', { silent = true })
-- vim.keymap.set('n', '<C-o>', '<C-w>o', { silent = true })
-- vim.keymap.set('v', '<C-c>', '"*y:let @+=@*<CR>', { silent = true })
vim.keymap.set('n', '<Leader>b', ':bd<CR>:bn<CR>', { silent = true }) -- close the current buffer and then enter the first opened buffer

-- Git Gutter mappings
-- vim.keymap.set('n', ']h', '<Plug>(GitGutterNextHunk)', {})
-- vim.keymap.set('n', '[h', '<Plug>(GitGutterPrevHunk)', {})

-- Jump to the next function
vim.keymap.set('n', ']f', ":call search('\\(\\(if\\\\|for\\\\|while\\\\|switch\\\\|catch\\)\\\\_s*\\)\\@64<!(\\\\_[^)]*)\\\\_[^;{}()]*\\zs{', 'w')<CR>", { silent = true })

-- Jump to the previous function
vim.keymap.set('n', '[f', ":call search('\\(\\(if\\\\|for\\\\|while\\\\|switch\\\\|catch\\)\\\\_s*\\)\\@64<!(\\\\_[^)]*)\\\\_[^;{}()]*\\zs{', 'bw')<CR>", { silent = true })


-- This is not working !!!
vim.cmd([[
  function! QuitVim()
    let choice = confirm("This will Exit without saving are you sure ?", "&yes\n&no", 1)
    if choice == 1
      execute "q!"
      echon "Good Luck !"
      return
    endif
    echon "Action canceled !"
  endfunction
]])

function QuitVim()
  local choice = vim.fn.confirm("This will Exit without saving are you sure ?", "&yes\n&no", 1)
  if choice == 1 then
    vim.cmd("q!")
    vim.api.nvim_echo({{"Good Luck !", "MoreMsg"}}, true, {})
  else
    vim.api.nvim_echo({{"Action canceled !", "WarningMsg"}}, true, {})
  end
end

-- 設定快捷鍵為 <Leader>d
vim.api.nvim_set_keymap('n', '<Leader>d', ':ConvertToDecimalSpace<CR>', { noremap = true, silent = true })

-- Convert String text to Decimal
vim.cmd([[command! -range=% -nargs=0 ConvertToDecimal <line1>,<line2>s/\_./\=char2nr(submatch(0)) . ' '/g]])


function NextBuffer()
    -- 執行 :ls 並將輸出存儲在變量中
    local ls_output = vim.api.nvim_exec("ls", true)
    print(ls_output)

    -- 尋找 %a 這個 row 的位置
    local percent_a_row = ls_output:find("%%%a[^\n]*")
    print(percent_a_row)

    -- 如果找到了 %a 這個 row
    if percent_a_row then
        -- 取得 %a 這個 row 的下一個 row 的最前面的數字
        local next_row = ls_output:match("%d+", percent_a_row + 1)
        print(next_row)
        if next_row then
            -- 使用抓取的數字執行 :b<數字>
            vim.api.nvim_command("b" .. next_row)
        end
    else
        -- 沒有找到 %a，取得整個 :ls 命令輸出中的第一個 row 最前面的數字
        local first_row = ls_output:match("%d+")
        if first_row then
            -- 使用抓取的數字執行 :b<數字>
            vim.api.nvim_command("b" .. first_row)
        end
    end
end

-- 將 Lua 函數映射到 <Leader>n 鍵
-- vim.api.nvim_set_keymap('n', '<Leader>c', '<Cmd>lua NextBuffer()<CR>', { silent = true })
