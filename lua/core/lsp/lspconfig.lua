--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)

    local telescope_builtin = require("core.helper").safe_require("telescope.builtin")

    -- helper function
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Rename the variable under your cursor.
    -- Most Language Servers support renaming across files, etc.
    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    -- Find references for the word under your cursor.
    map('grr', telescope_builtin.lsp_references, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under your cursor.
    -- Useful when your language has ways of declaring types without an actual implementation.
    map('gri', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')

    -- Jump to the definition of the word under your cursor.
    -- This is where a variable was first declared, or where a function is defined, etc.
    -- To jump back, press <C-t>.
    map('grd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    -- For example, in C this would take you to the header.
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Fuzzy find all the symbols in your current document.
    -- Symbols are things like variables, functions, types, etc.
    map('gO', telescope_builtin.lsp_document_symbols, 'Open Document Symbols')

    -- Fuzzy find all the symbols in your current workspace.
    -- Similar to document symbols, except searches over your entire project.
    map('gW', telescope_builtin.lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

    -- Jump to the type of the word under your cursor.
    -- Useful when you're not sure what type a variable is and you want to see
    -- the definition of its *type*, not where it was *defined*.
    map('grt', telescope_builtin.lsp_type_definitions, '[G]oto [T]ype Definition')

    -- This is a helper function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
    ---@param client vim.lsp.Client
    ---@param method vim.lsp.protocol.Method
    ---@param bufnr? integer some lsp support methods only in specific files
    ---@return boolean
    local function client_supports_method(client, method, bufnr)
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    -- See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    -- The following code creates a keymap to toggle "inlay hints" in your
    -- code, if the language server you are using supports them
    --
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end
  end
})

--------------------------------------------------------------
-- Old config


-- this "on_attach" func allows you to use the keymaps, when you are editing the filetypes that are supporting lsp server if you have set up that specific lsp server
-- local on_attach = function(client, bufnr)
--     local opts = { noremap = true, silent = true, buffer = bufnr }

--     -- set keybinds
--     vim.keymap.set('n', 'gf', "<cmd>Lspsaga lsp_finder<CR>", opts)
--     vim.keymap.set('n', 'gD', "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--     vim.keymap.set('n', 'gd', ":Lspsaga peek_definition<CR>", opts)
--     vim.keymap.set('n', 'gi', "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--     vim.keymap.set('n', '<leader>ca', "<cmd>Lspsaga code_action<CR>", opts)
--     vim.keymap.set('n', '<leader>rn', "<cmd>Lspsaga rename<CR>", opts)
--     vim.keymap.set('n', '<leader>d', "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
--     vim.keymap.set('n', '<leader>d', "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
--     vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
--     vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
--     vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)
--     vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)ㄐ

--     -- rename file and it will update to all of the imports
--     if client.name == "ts_ls" then
--         vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
--     end
-- end


-- used to enable autocompletion
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- lspconfig["gopls"].setup({
--     filetypes = { "go", "gomod", "gowork", "gotmpl" },
--     cmd = { "gopls" },
--     capabilities = capabilities,
--     on_attach = on_attach
-- })

-- lspconfig["ts_ls"].setup({
--     filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "typescript.ts" },
--     cmd = { "typescript-language-server", "--stdio" },
--     capabilities = capabilities,
--     on_attach = on_attach
-- })

-- lspconfig["lua_ls"].setup({
--     cmd = { "lua-language-server" },
--     filetypes = { "lua" },
--     capabilities = capabilities,
--     on_attach = on_attach,
--     -- Here we add "diagnostics" to suppress Warning message "Undefined global 'vim'"
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { "vim" },
--             },
--             runtime = {
--                 -- Tell the language server which version of Lua you're using
--                 -- (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT'
--             },
--             -- Make the server aware of Neovim runtime files
--             workspace = {
--                 checkThirdParty = false,
--                 library = {
--                     vim.env.VIMRUNTIME
--                     -- "${3rd}/luv/library"
--                     -- "${3rd}/busted/library",
--                 }
--                 -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
--                 -- library = vim.api.nvim_get_runtime_file("", true)
--             }
--         }
--     }
-- })

-- lspconfig["jsonls"].setup({
--     filetypes = { "json" },
--     capabilities = capabilities,
--     on_attach = on_attach
-- })
