-- vim.cmd("colorscheme nightfly")
-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- if not status then
--   print("Colorscheme not found")
--   return
-- end

-- gruvbox
-- vim.o.termguicolors = true
-- vim.cmd [[ colorscheme gruvbox ]]

function ColorMyNvim(color)
  color = color or "nightfly"
  vim.cmd("colorscheme nightfly")


  vim.api.nvim_set_hl(0, "Normal",  { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
  vim.api.nvim_set_hl(0, "GitGutter", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { bg = "none" })
  vim.api.nvim_set_hl(0, "Lualine", { bg = "none" })
  vim.api.nvim_set_hl(0, "Winbar", { bg = "none" })
end

ColorMyNvim()
