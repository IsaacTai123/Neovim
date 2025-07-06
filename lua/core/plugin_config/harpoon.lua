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
  { "<leader>b", group = "Harpoon [Bookmark]" },
  { "<leader>ba", mark.add_file, desc = "Add mark to File" },
  { "<leader>br", mark.rm_file, desc = "Remove File mark" },
  { "<leader>bc", mark.clear_all, desc = "Clear all marks" },
  { "<leader>bm", ui.toggle_quick_menu, desc = "Harpoon Menu" },
  { "<leader>bn", ui.nav_next, desc = "Next File" },
  { "<leader>bp", ui.nav_prev, desc = "Previous File" },
  { "<leader>b1", function() ui.nav_file(1) end, desc = "Go to File 1" },
  { "<leader>b2", function() ui.nav_file(2) end, desc = "Go to File 2" },
  { "<leader>b3", function() ui.nav_file(3) end, desc = "Go to File 3" },
  { "<leader>b4", function() ui.nav_file(4) end, desc = "Go to File 4" },
  { "<leader>bd", function() helper.input_prompt("Enter mark index to remove: ", RemoveMark) end, desc = "Remove specific mark" },
})
