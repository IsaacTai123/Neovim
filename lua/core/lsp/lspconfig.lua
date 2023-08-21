local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then 
  print("Falied to load lspconfig")
  return 
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then 
  print("Falied to load cmp_nvim_lsp")
  return 
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript then 
  print("Falied to load typescript")
  return 
end

-- this "on_attach" func allows you to use the keymaps, when you are editing the filetypes that are supporting lsp server if you have set up that specific lsp server
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set('n', 'gf', "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap.set('n', 'gD', "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.kepmap.set('n', 'gd', ":Lspsaga peek_definition<CR>", opts)
    kepmap.set('n', 'gi', "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    kepmap.set('n', '<leader>ca', "<cmd>Lspsaga code_action<CR>", opts)
    kepmap.set('n', '<leader>rn', "<cmd>Lspsaga rename<CR>", opts)
    kepmap.set('n', '<leader>d', "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    kepmap.set('n', '<leader>d', "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    kepmap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    kepmap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    kepmap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)
    kepmap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)

    -- rename file and it will update to all of the imports
    if client.name == "tsserver" then
      keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
    end
end


-- used to enable autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["gopls"].setup({
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  cmd = { "gopls" },
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["lua_ls"].setup({
  filetypes = { "lua" },
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["jsonls"].setup({
  filetypes = { "json" },
  capabilities = capabilities,
  on_attach = on_attach
})
