local M = {}

--- Safely require a Lua module.
--- @param name string The name of the module to require.
--- @param opts table|nil Optional settings (e.g., { notify = false } to suppress error notifications).
--- @return any|nil Returns the required module, or nil if it failed.
function M.safe_require(name, opts)
  local ok, module = pcall(require, name)
  if not ok then
    if not opts or opts.notify ~= false then
      vim.notify("Failed to load module: " .. name, vim.log.levels.ERROR)
    end
    return nil
  end
  return module
end

--- Prompt user for input and pass result to callback
--- @param message string Prompt text to show
--- @param callback fun(input: string|nil) Function to handle user input
--- @return nil
function M.input_prompt(message, callback)
  vim.ui.input({ prompt = message }, function(input)
    if input then
      callback(input)
    end
  end)
end

return M
