local helper = require("core.helper")
local tokyonight = helper.safe_require("tokyonight")

---@diagnostic disable-next-line: missing-fields
tokyonight.setup({
  style = "moon",
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
})

-- Load the colorscheme here.
-- Like many other themes, this one has different styles, and you could load
-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
vim.cmd.colorscheme 'tokyonight-night'

-- function ColorMyNvim(color)
--   color = color or "nightfly"
--   vim.cmd("colorscheme nightfly")


--   vim.api.nvim_set_hl(0, "Normal",  { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
--   vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
--   vim.api.nvim_set_hl(0, "GitGutter", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { bg = "none" })
--   vim.api.nvim_set_hl(0, "Lualine", { bg = "none" })
--   vim.api.nvim_set_hl(0, "Winbar", { bg = "none" })
-- end

-- ColorMyNvim()
