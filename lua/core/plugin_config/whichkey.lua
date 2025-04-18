vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  layout = {
    width = { min = 20 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
}

-- Load neogit 
-- #################################
local ok, neogit = pcall(require, "neogit")
if not ok or neogit == nil then
    return
    print("Failed to load Neogit")
end
-- #################################

local wk = require("which-key")

-- Floaterm group
wk.add({
  { "<Space>f", group = "Floaterm" },
  { "<Space>fc", "<cmd>FloatermNew<cr>", desc = "Create new floaterm" },
  { "<Space>fn", "<cmd>FloatermNext<cr>", desc = "Next floaterm" },
  { "<Space>fp", "<cmd>FloatermPrev<cr>", desc = "Previous floaterm" },
  { "<Space>ff", "<cmd>FloatermFirst<cr>", desc = "First floaterm" },
  { "<Space>fl", "<cmd>FloatermLast<cr>", desc = "Last floaterm" },
  { "<Space>fT", "<cmd>FloatermToggle<cr>", desc = "Toggle floaterm window" },
  { "<Space>fk", "<cmd>FloatermKill<cr>", desc = "Kill floaterm window" },
  { "<Space>fb", "<cmd>FloatermNew! --height=0.2 --width=0.98 --wintype=normal --name=terminal --position=bottom --autoclose=1 cd %:p:h<cr>", desc = "Create button terminal" },
  { "<Space>fg", "<cmd>FloatermNew! --height=0.98 --width=0.98 --wintype=float --name=lazygit --position=center --autoclose=1 lazygit<cr>", desc = "lazygit" },
  { "<Space>ft", "<cmd>FloatermNew! --height=0.98 --width=0.98 --wintype=float --name=lazygit --position=center --autoclose=1 tig<cr>", desc = "tig" },
  { "<Space>fa", "<cmd>FloatermNew! --height=0.98 --width=0.98 --wintype=float --name=lazygit --position=center --autoclose=1 tig --all<cr>", desc = "tig all reference" }
})

-- Telescope group
wk.add({
  { "<Space>t", group = "Telescope" },
  { "<Space>tj", "<cmd>lua require('telescope.builtin').grep_string<cr>", desc = "Search all in current file" },
  { "<Space>ta", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Search all in cur dir" },
  { "<Space>to", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "Search in oldfiles" },
  { "<Space>tb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Search in buffers" },
  { "<Space>tf", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
  { "<Space>th", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Search for help tags" },
  { "<Space>tH", "<cmd>lua require('telescope.builtin').command_history<cr>", desc = "Search for command history" },
  { "<Space>tw", "<cmd>lua require('telescope.builtin').spell_suggest<cr>", desc = "Spell suggest" },
  { "<Space>tg", "<cmd>lua require('telescope.builtin').git_files<cr>", desc = "Git files" },
  { "<Space>tG", "<cmd>lua require('telescope.builtin').git_status<cr>", desc = "Git status" },
  { "<Space>tc", "<cmd>lua require('telescope.builtin').git_commits<cr>", desc = "Git commits" },
  { "<Space>ts", "<cmd>lua require('telescope.builtin').git_stash<cr>", desc = "Git stash" },
  { "<Space>tv", "<cmd>lua require('telescope.builtin').treesitter<cr>", desc = "Treesitter show variable" },
  { "<Space>tR", "<cmd>lua require('telescope.builtin').lsp_references<cr>", desc = "Lsp references" },
  { "<Space>tI", "<cmd>lua require('telescope.builtin').lsp_incoming_calls<cr>", desc = "Lsp incoming_calls" },
  { "<Space>tO", "<cmd>lua require('telescope.builtin').lsp_outcoming_calls<cr>", desc = "Lsp outcoming_calls" },
  { "<Space>tS", "<cmd>lua require('telescope.builtin').lsp_document_symbols<cr>", desc = "Lsp document symbols" },
  { "<Space>tW", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols<cr>", desc = "Lsp workspace symbols" },
  { "<Space>tL", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols<cr>", desc = "Lsp dynamic work symbols" },
  { "<Space>tD", "<cmd>lua require('telescope.builtin').lsp_diagnostics<cr>", desc = "Lsp diagnostics" },
  { "<Space>tP", "<cmd>lua require('telescope.builtin').lsp_implementations<cr>", desc = "Lsp implementation" },
  { "<Space>tT", "<cmd>lua require('telescope.builtin').lsp_type_definitions<cr>", desc = "Lsp type definitions" },
  { "<Space>tt", "<cmd>TodoTelescope<cr>", desc = "Todo Search" },
})

-- True-zen group
wk.add({
  { "<Space>z", group = "True-zen" },
  { "<Space>zn", function() local first = 0 local last = vim.api.nvim_buf_line_count(0) GlobTruezen.narrow(first, last) end, desc = "Narrow mode" },
  { "<Space>zf", function() GlobTruezen.focus() end, desc = "Focus mode" },
  { "<Space>zm", function() GlobTruezen.minimalist() end, desc = "Minimal mode" },
  { "<Space>za", function() GlobTruezen.ataraxis() end, desc = "Ataraxis mode" },
})

-- System group
wk.add({
  { "<Space>s", group = "System" },
  { "<Space>sj", ":horizontal resize -2<cr>", desc = "Decrease the height" },
  { "<Space>sk", ":horizontal resize +2<cr>", desc = "Increase the height" },
  { "<Space>sh", ":vertical resize -2<cr>", desc = "Expand the weight to left" },
  { "<Space>sl", ":vertical resize +2<cr>", desc = "Shrink the weight to right" },
  { "<Space>sb", ":bufdo bw!<cr>", desc = "Close all buffer without saving it" },
  { "<Space>sn", ":tabnext<cr>", desc = "Switch to next tab" },
  { "<Space>sp", ":tabprevious<cr>", desc = "Switch to prev tab" },
  { "<Space>sc", ":tabnew<cr>", desc = "Create a new tab" },
  { "<Space>ss", ":sp<cr>", desc = "Split window horizontal" },
})

-- Packer group
wk.add({
  { "<Space>p", group = "Packer" },
  { "<Space>pi", ":PackerInstall<cr>", desc = "Install package" },
  { "<Space>ps", ":PackerSync<cr>", desc = "Packer Sync" },
  { "<Space>pS", ":PackerStatus<cr>", desc = "Packer Status" },
  { "<Space>pu", ":PackerUpdate<cr>", desc = "Packer update" },
})

-- LSP group
wk.add({
  { "<Space>l", group = "LSP" },
  { "<Space>la", "<cmd>Lspsaga code_action<cr>", desc = "Action" },
  { "<Space>lk", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
  { "<Space>lg", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto definition" },
  { "<Space>lh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
  { "<Space>lH", "<cmd>Lspsaga hover_doc ++keep<cr>", desc = "Hover doc keep" },
  { "<Space>lt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek type definition" },
  { "<Space>lT", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Goto type definition" },
  { "<Space>lR", "<cmd>Lspsaga project_replace<cr>", desc = "Project replace" },
  { "<Space>lO", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
  { "<Space>ls", "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
  { "<Space>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line diagnostics" },
  { "<Space>lb", "<cmd>Lspsaga show_buf_diagnostics<cr>", desc = "Buffer diagnostics" },
  { "<Space>lc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "Cursor diagnostics" },
  { "<Space>ln", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Jump to next diagnostics" },
  { "<Space>lp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Jump to prev diagnostics" },
  { "<Space>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
  { "<Space>lz", "<cmd>Lspsaga term_toggle<cr>", desc = "Terminal toggle" },
  { "<Space>li", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming calls" },
  { "<Space>lo", "<cmd>Lspsaga outcoming_calls<cr>", desc = "Outcoming calls" },
  { "<Space>lf", "<cmd>Lspsaga finder tyd+def+ref+imp<cr>", desc = "Finder tyd + def + ref + imp" },
  { "<Space>lfi", "<cmd>Lspsaga finder imp<cr>", desc = "Finder implementation" },
  { "<Space>lfr", "<cmd>Lspsaga finder ref<cr>", desc = "Finder reference" },
  { "<Space>lft", "<cmd>Lspsaga finder tyd<cr>", desc = "Finder type definition" },
  { "<Space>lF", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
  { "<Space>lI", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<Space>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
  { "<Space>lD", "<cmd>lua require('telescope.builtin').lsp_document_symbols<cr>", desc = "Document Symbols" },
})

-- Gitgutter group
wk.add({
  { "<Space>g", group = "Gitgutter" },
  { "<Space>gn", "<cmd>GitGutterNextHunk<cr>", desc = "Next hunk" },
  { "<Space>gp", "<cmd>GitGutterPrevHunk<cr>", desc = "Prev hunk" },
  { "<Space>gq", "<cmd>GitGutterQuickFix<cr>", desc = "Quickfix" },
  { "<Space>gd", "<cmd>GitGutterDiffOrig<cr>", desc = "Diff" },
  { "<Space>gf", "<cmd>GitGutterFold<cr>", desc = "Fold" },
  { "<Space>gh", "<cmd>GitGutterLineHighlightsToggle<cr>", desc = "Toggle Highlight" },
  { "<Space>ge", "<cmd>GitGutterLineNrHighlightsToggle<cr>", desc = "Toggle Number Highlight" },
  { "<Space>gH", "<cmd>GitGutterStageHunk<cr>", desc = "Stage Hunk" },
  { "<Space>gU", "<cmd>GitGutterUndoHunk<cr>", desc = "Undo Hunk" },
  { "<Space>gP", "<cmd>GitGutterPreviewHunk<cr>", desc = "Preview Hunk" },
  { "<Space>gs", "<cmd>GitGutterAll<cr>", desc = "Update signs across all buffer" },
  { "<Space>gE", "<cmd>GitGutterBufferEnable<cr>", desc = "Buffer enable" },
  { "<Space>gt", "<cmd>GitGutterBufferToggle<cr>", desc = "Buffer toggle" },
})

-- Neogit group
wk.add({
    { "<Space>n", group = "Neogit" },
  { "<Space>no", function() neogit.open() end, desc = "Open Neogit" },
    { "<Space>nc", function() neogit.open({ "commit" }) end, desc = "Open Neogit commit window" },
    { "<Space>nh", function() neogit.open({ kind = "split" }) end, desc = "Open horizontal" },
    { "<Space>nv", function() neogit.open({ kind = "vsplit" }) end, desc = "Open vertical" },
    { "<Space>nt", function() neogit.open({ kind = "tab" }) end, desc = "Open in tab" },
    { "<Space>ny", function() neogit.open({ cwd = "~/.config/nvim/" }) end, desc = "Open nvim git repo" },
})

-- Conflict group
wk.add({
  { "<Space>c", group = "Conflict" },
  { "<Space>ca", "<cmd>GitConflictChooseBoth<cr>", desc = "Choose both" },
  { "<Space>cb", "<cmd>GitConflictChooseBase<cr>", desc = "Choose base" },
  { "<Space>cx", "<cmd>GitConflictChooseNone<cr>", desc = "Choose none" },
  { "<Space>co", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose ours" },
  { "<Space>ct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose theirs" },
  { "<Space>cn", "<cmd>GitConflictNextConflict<cr>", desc = "Next conflict" },
  { "<Space>cp", "<cmd>GitConflictPrevConflict<cr>", desc = "Prev conflict" },
  { "<Space>cl", "<cmd>GitConflictListQf<cr>", desc = "List conflict" },
  { "<Space>cr", "<cmd>GitConflictRefresh<cr>", desc = "Conflict refresh" },
})

-- DiffView group
wk.add({
  { "<Space>d", group = "DiffView" },
  { "<Space>dc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
  { "<Space>dh", "<cmd>DiffviewFileHistory<cr>", desc = "History Current branch" },
  { "<Space>df", "<cmd>DiffviewFileHistory %<cr>", desc = "History Current file" },
  { "<Space>do", "<cmd>DiffviewOpen<cr>", desc = "Diffview with current index" },
  { "<Space>da", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "Diffview HEAD~1" },
  { "<Space>db", "<cmd>DiffviewOpen HEAD~2<cr>", desc = "Diffview HEAD~2" },
  { "<Space>dt", "<cmd>DiffviewToggleFiles<cr>", desc = "Diffview Toggle file" },
  { "<Space>dr", "<cmd>DiffviewRefresh<cr>", desc = "Diffview Refresh" },
})

-- Others group
wk.add({
  { "<Space>o", group = "Others" },
  { "<Space>oe", "<cmd>ConvertToDecimal<cr><cr>", desc = "Convert whole page to Decimal" },
  { "<Space>ou", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" },
  { "<Space>ol", "<cmd>set relativenumber!<cr>", desc = "Toggle Relativenumber" },
  { "<Space>on", "<cmd>set number!<cr>", desc = "Toggle Line Number" }
})
