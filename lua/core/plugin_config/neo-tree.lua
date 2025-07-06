local helper = require("core.helper")
local neo_tree = helper.safe_require("neo-tree")

neo_tree.setup({
	close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
	enable_git_status = true,
    enable_diagnostics = true,
})

vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal<CR>")