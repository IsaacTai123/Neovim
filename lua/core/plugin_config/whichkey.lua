vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

local wk = require("which-key")

wk.register({
  w = {
    name = "Sample",
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
  f = {
    name = "Floaterm", -- optional group name
    c = { "<cmd>FloatermNew<cr>", "Create new floaterm"},
    n = { "<cmd>FloatermNext<cr>", "Next floaterm"},
    p = { "<cmd>FloatermPrev<cr>", "Previous floaterm"},
    t = { "<cmd>FloatermToggle<cr>", "Toggle floaterm window"},
    k = { "<cmd>FloatermKill<cr>", "Kill floaterm window"},
    b = { "<cmd>FloatermNew! --height=0.2 --width=0.98 --wintype=normal --name=terminal --position=bottom --autoclose=1 cd %:p:h<cr>", "Create button terminal"},
    g = { "<cmd>FloatermNew! --height=0.85 --width=0.98 --wintype=normal --name=lazygit --position=center --autoclose=1 lazygit<cr>", "Create button terminal"},
  },
  t = {
    name = "Telescope",
    j = { "<cmd>Telescope grep_string<cr>", "Search all in current file" },
    a = { "<cmd>Telescope live_grep<cr>", "Search all in cur dir" },
    o = { "<cmd>Telescope oldfiles<cr>", "Search in oldfiles" },
    b = { "<cmd>Telescope buffers<cr>", "Search in buffers" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    h = { "<cmd>Telescope help_tags<cr>", "Search for help tags" },
    H = { "<cmd>Telescope command_history<cr>", "Search for command history" },
    g = { "<cmd>Telescope git_files<cr>", "Git files" },
    G = { "<cmd>Telescope git_status<cr>", "Git status" },
    c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
    s = { "<cmd>Telescope git_stash<cr>", "Git stash" },
    v = { "<cmd>Telescope treesitter<cr>", "Treesitter show variable" },
    R = { "<cmd>Telescope lsp_references<cr>", "Lsp references" },
    I = { "<cmd>Telescope lsp_incoming_calls<cr>", "Lsp incoming_calls" },
    O = { "<cmd>Telescope lsp_outcoming_calls<cr>", "Lsp outcoming_calls" },
    S = { "<cmd>Telescope lsp_document_symbols<cr>", "Lsp document symbols" },
    W = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Lsp workspace symbols" },
    L = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Lsp dynamic work symbols" },
    D = { "<cmd>Telescope lsp_diagnostics<cr>", "Lsp diagnostics" },
    P = { "<cmd>Telescope lsp_implementations<cr>", "Lsp implementation" },
    T = { "<cmd>Telescope lsp_type_definitions<cr>", "Lsp type definitions" },
  },
  s = {
    name = "System",
    j = { ":horizontal resize -2<cr>", 'Decrease the height'  },
    k = { ":horizontal resize +2<cr>", 'Increase the height'  },
    h = { ":vertical resize -2<cr>", 'expand the weight to left'  },
    l = { ":vertical resize +2<cr>", 'shrink the weight to right'  },
    b = { ":bufdo bw!<cr>", 'close all buffer without saveing it'  },
  },
  p = {
    name = "Packer",
    i = { ":PackerInstall<cr>", "Install package" },
    s = { ":PackerSync<cr>", "Packer Sync" },
    S = { ":PackerStatus<cr>", "Packer Status" },
    u = { ":PackerUpdate<cr>", "Packer update" },
  },
  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Action"},
    k = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition"},
    g = { "<cmd>Lspsaga goto_definition<cr>", "Goto definition"},
    h = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc"},
    H = { "<cmd>Lspsaga hover_doc ++keep<cr>", "Hover doc keep"},
    T = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek type definition"},
    t = { "<cmd>Lspsaga goto_type_definition<cr>", "Goto type definition"},
    R = { "<cmd>Lspsaga project_replace<cr>", "Project replace"},
    O = { "<cmd>Lspsaga outline<cr>", "Outline"},
    s = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Workspace diagnostics"},
    d = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Line diagnostics"},
    b = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "Buffer diagnostics"},
    c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Cursor diagnostics"},
    n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Jump to next diagnostics"},
    p = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Jump to prev diagnostics"},
    r = { "<cmd>Lspsaga rename<cr>", "Rename"},
    z = { "<cmd>Lspsaga term_toggle<cr>", "Terminal toggle"},
    i = { "<cmd>Lspsaga incoming_calls<cr>", "Incoming calls"},
    o = { "<cmd>Lspsaga outcoming_calls<cr>", "Outcoming calls"},
    f = {
      name = "finder",
      f = { "<cmd>Lspsaga finder tyd+def+ref+imp<cr>", "Finder tyd + def + ref + imp"},
      i = { "<cmd>Lspsaga finder imp<cr>", "Finder implementation"},
      r = { "<cmd>Lspsaga finder ref<cr>", "Finder reference"},
      t = { "<cmd>Lspsaga finder tyd<cr>", "Finder type definition"},
    },

    -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    -- c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
    F = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    -- F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
    I = { "<cmd>LspInfo<cr>", "Info" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    D = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  },
  g = {
    name = "Gitgutter",
    n = { "<cmd>GitGutterNextHunk<cr>", "next hunk" },
    p = { "<cmd>GitGutterPrevHunk<cr>", "prev hunk" },
    q = { "<cmd>GitGutterQuickFix<cr>", "Quickfix" },
    d = { "<cmd>GitGutterDiffOrig<cr>", "Diff" },
    f = { "<cmd>GitGutterFold<cr>", "fold" },
    h = { "<cmd>GitGutterLineHighlightsToggle<cr>", "Toggle Highlight" },
    e = { "<cmd>GitGutterLineNrHighlightsToggle<cr>", "Toggle Number Highlight" },
    H = { "<cmd>GitGutterStageHunk<cr>", "Stage Hunk" },
    U = { "<cmd>GitGutterUndoHunk<cr>", "Undo Hunk" },
    P = { "<cmd>GitGutterPreviewHunk<cr>", "Preview Hunk" },
    s = { "<cmd>GitGutterAll<cr>", "Update signs across all buffer" },
  },
  c = {
    name = "Conflict",
    a = { "<cmd>GitConflictChooseBoth<cr>", "choose both" },
    b = { "<cmd>GitConflictChooseBase<cr>", "choose base" },
    x = { "<cmd>GitConflictChooseNone<cr>", "choose none" },
    o = { "<cmd>GitConflictChooseOurs<cr>", "choose ours" },
    t = { "<cmd>GitConflictChooseTheirs<cr>", "choose Theirs" },
    n = { "<cmd>GitConflictNextConflict<cr>", "next conflict" },
    p = { "<cmd>GitConflictPrevConflict<cr>", "prev conflict" },
    l = { "<cmd>GitConflictListQf<cr>", "list conflict" },
    r = { "<cmd>GitConflictRefresh<cr>", "conflict refresh" },
  },
  o = {
    name = "Others",
    e = { "<cmd>ConvertToDecimal<cr><cr>", "Convert whole page to Decimal" },
    u = { "<cmd>UndotreeToggle<cr>", "Undo tree" }
  }
}, { prefix = "<Space>" })
