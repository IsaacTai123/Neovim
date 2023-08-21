local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  print("Failed to load Lspsaga")
  return
end

saga.setup({
  move_in_saga = { prev = "<C-k>", next = "<C-j>" },
  finder_action_keys = {
    open = "<CR>",
  },
  definition_action_keys = {
    edit = "<CR>"
  },
  finder = {
    methods = {
      tyd = 'textDocument/typeDefinition'
    }
  },
  outline = {
    max_height = 0.8
  }
})
