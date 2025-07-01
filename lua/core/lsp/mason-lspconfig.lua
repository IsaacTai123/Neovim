local helper = require("core.helper")
local mason_lspconfig = helper.safe_require("mason-lspconfig")
local lspconfig = helper.safe_require("lspconfig")
local capabilities = require('blink.cmp').get_lsp_capabilities()
local servers = require("core.lsp.servers")


mason_lspconfig.setup {
	ensure_installed = {}, -- explicitly set to an empty table (we already handled this via mason-tool-installer)
	automatic_enable = false,
	automatic_installation = false,
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}

			-- This handles overriding only values explicitly passed
			-- by the server configuration above. Useful when disabling
			-- certain features of an LSP (for example, turning off formatting for ts_ls)
			server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
			lspconfig[server_name].setup(server)
		end,
	},
}