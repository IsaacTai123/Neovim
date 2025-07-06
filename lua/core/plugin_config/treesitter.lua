local helper = require("core.helper")
local treesitter = helper.safe_require("nvim-treesitter")

treesitter.setup ({
  ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc", "javascript", "typescript", "dockerfile", "yaml", "json"},

	-- Autoinstall languages that are not installed
  auto_install = true,
  highlight = {
    enable = true,
  },
})