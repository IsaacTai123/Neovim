function CheckStatus(param)
  if not param then
    print(string.format("Failed to load %s", param))
    return
  end
end


local harpoon_mark_status, mark = pcall(require, "harpoon.mark")
CheckStatus(harpoon_mark_status)
local harpoon_ui_status, ui = pcall(require, "harpoon.ui")
CheckStatus(harpoon_ui_status)
local harpoon_tmux_status, tmux = pcall(require, "harpoon.tmux")
CheckStatus(harpoon_tmux_status)

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>r", mark.rm_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>n", ui.nav_next)
vim.keymap.set("n", "<leader>p", ui.nav_prev)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)

-- lua require("harpoon.tmux").gotoTerminal("{down-of}")   -- focus the pane directly below
-- lua require("harpoon.tmux").sendCommand("%3", "ls")     -- send a command to the pane with id '%3'

function RemoveMark(param)
  if not param then
    print("Failed")
    return
  end
  mark.rm_file(param)
end

vim.cmd("command! -nargs=1 RemoveMark lua RemoveMark(<args>)")
