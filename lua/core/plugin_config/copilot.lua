-- GitHub Copilot Configuration
-- Basic settings
vim.g.copilot_enabled = false

-- Set Copilot trigger delay (milliseconds)
vim.g.copilot_idle_delay = 75

-- Set maximum number of Copilot suggestions
vim.g.copilot_max_completion_count = 10

-- Disable Copilot for specific file types
vim.g.copilot_filetypes = {
  ["*"] = true,
  ["gitcommit"] = false,
  ["gitrebase"] = false,
  ["hgcommit"] = false,
  ["svn"] = false,
  ["cvs"] = false,
  [".env"] = false,
  ["plaintext"] = false,
  ["markdown"] = true,
  ["yaml"] = true,
  ["json"] = true,
}

-- Custom keybindings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Accept suggestion
keymap("i", "<C-l>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

-- Accept word
keymap("i", "<C-;>", "copilot#AcceptWord()", { expr = true, replace_keycodes = false })

-- Accept line
keymap("i", "<C-j>", "copilot#AcceptLine()", { expr = true, replace_keycodes = false })

-- Next suggestion
keymap("i", "<M-]>", "copilot#Next()", { expr = true, replace_keycodes = false })

-- Previous suggestion
keymap("i", "<M-[>", "copilot#Previous()", { expr = true, replace_keycodes = false })

-- Manually trigger suggestion
keymap("i", "<C-\\>", "copilot#Suggest()", { expr = true, replace_keycodes = false })

-- Dismiss suggestion
keymap("i", "<C-]>", "copilot#Dismiss()", { expr = true, replace_keycodes = false })

-- Normal mode keybindings
keymap("n", "<leader>ce", ":Copilot enable<CR>", opts)   -- Enable Copilot
keymap("n", "<leader>cd", ":Copilot disable<CR>", opts)  -- Disable Copilot
keymap("n", "<leader>ct", ":Copilot toggle<CR>", opts)   -- Toggle Copilot
keymap("n", "<leader>cs", ":Copilot status<CR>", opts)   -- Check Copilot status
keymap("n", "<leader>cp", ":Copilot panel<CR>", opts)    -- Open Copilot panel

-- Auto commands
local copilot_group = vim.api.nvim_create_augroup("CopilotConfig", { clear = true })

-- Disable Copilot in specific buffer types
vim.api.nvim_create_autocmd("BufEnter", {
  group = copilot_group,
  pattern = { "*.env", "*.secret", "*.key" },
  callback = function()
    vim.cmd("Copilot disable")
  end,
})

-- Set Copilot suggestion colors
vim.api.nvim_create_autocmd("ColorScheme", {
  group = copilot_group,
  callback = function()
    vim.api.nvim_set_hl(0, "CopilotSuggestion", {
      fg = "#555555",
      ctermfg = 8,
      italic = true
    })
  end,
})

-- Set colors on initialization
vim.api.nvim_set_hl(0, "CopilotSuggestion", {
  fg = "#555555",
  ctermfg = 8,
  italic = true
})

-- Status message
vim.api.nvim_create_user_command("CopilotInfo", function()
  local status = vim.fn["copilot#Enabled"]() == 1 and "enabled" or "disabled"
  print("Copilot is " .. status)
end, {})

-- If you want to integrate with nvim-cmp, set priority
-- Prevent Copilot suggestions from conflicting with cmp
vim.g.copilot_no_tab_map = true

print("Copilot configuration loaded successfully!")
