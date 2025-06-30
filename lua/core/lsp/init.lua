--[[
LSP (Language Server Protocol) is a protocol that defines how editors (like Neovim or VSCode) communicate with language servers.

In the past, each editor had to implement its own logic for features like auto-completion, go-to definition, and diagnostics. Maintaining this was difficult and inconsistent.

LSP standardizes this interaction:

	- Language features (completion, diagnostics, definition, refactoring, etc.) are handled by the language server
	- Editors only need to support LSP to work with many different languages

Originally created by Microsoft for VSCode, LSP is now an open standard supported by many editors, including Neovim, Emacs, and Sublime Text.

In Neovim:

	- The LSP client is built-in since version 0.5
	- We use 'mason.nvim' to install language servers easily (LSP server)
	- Then use 'nvim-lspconfig' to configure and connect the servers

LSP provides Neovim with features like:
	- Go to definition
	- Find references
	- Autocompletion
	- Symbol Search
	- and more!

Summary:

So LSP is a protocol that defines how editors communicate with language servers. Since Neovim has a built-in LSP client, we just need to use Mason to install the language servers and configure them with lspconfig to make everything work.


If you're wondering about lsp vs treesitter, you can check out the wonderfully
and elegantly composed help section, `:help lsp-vs-treesitter`

]]

require("core.lsp.lspconfig")
require("core.lsp.mason-tool-installer")
require("core.lsp.mason-lspconfig")
require("core.lsp.diagnostic")