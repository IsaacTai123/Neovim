local helper = require("core.helper")
local mark = helper.safe_require("harpoon.mark")
local ui = helper.safe_require("harpoon.ui")

if not mark or not ui then
  return
end

-- Custom function
function RemoveMark(param)
  if not param then
    print("Failed: No parameter provided")
    return
  end
  mark.rm_file(tonumber(param))
end

-- creates a custom Vim command called :RemoveMark
vim.cmd("command! -nargs=1 RemoveMark lua RemoveMark(<args>)")

-- whichkey
local wk = require("which-key")

wk.add({
  { "<Space>h", group = "Harpoon" },
  { "<Space>ha", mark.add_file, desc = "Add mark to File" },
  { "<Space>hr", mark.rm_file, desc = "Remove File mark" },
  { "<Space>hc", mark.clear_all, desc = "Clear all marks" },
  { "<Space>hm", ui.toggle_quick_menu, desc = "Harpoon Menu" },
  { "<Space>hn", ui.nav_next, desc = "Next File" },
  { "<Space>hp", ui.nav_prev, desc = "Previous File" },
  { "<Space>h1", function() ui.nav_file(1) end, desc = "Go to File 1" },
  { "<Space>h2", function() ui.nav_file(2) end, desc = "Go to File 2" },
  { "<Space>h3", function() ui.nav_file(3) end, desc = "Go to File 3" },
  { "<Space>h4", function() ui.nav_file(4) end, desc = "Go to File 4" },
  { "<Space>hd", function() helper.input_prompt("Enter mark index to remove: ", RemoveMark) end, desc = "Remove specific mark" },
})
