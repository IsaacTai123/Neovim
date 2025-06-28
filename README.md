# Plugin Overview & Usage

## 🚀 My Neovim Configuration

A modern and practical Neovim setup using packer.nvim as plugin manager. This configuration focuses on clean UI, efficient navigation, autocompletion, LSP, Git integration, and improved editing experience.

---
## 📦 Plugin Overview & Usage

🎨 UI & Appearance
- nightfly / gruvbox: Beautiful and consistent color schemes
- nvim-tree: File explorer (toggle with :NvimTreeToggle)
- bufferline: Tab-like buffer navigation
- lualine: Customizable statusline
- winbar.nvim: Display current file path in the window bar
- startify: Start screen with recent files and sessions
- undotree: View undo history (:UndotreeToggle)
- true-zen: Minimalist distraction-free editing (:TZAtaraxis)
- mini.icons: Icon support for statusline and LSP

---
## ⚡ Navigation & Motion

### Harpoon

Harpoon is a fast file bookmarking plugin for Neovim. It lets you quickly mark, jump to, and manage frequently used files — making it easier to switch between them without relying on tabs or buffers.

- Add current file to bookmark
- Open simple ui to navigate quickly
- Jump to any marked file
- Nav forware/backward
---
---

## 🐦‍🔥 Debug

### Circular Dependency Issue with Telescope

📌 Note:

Avoid requiring the entire `core.plugin_config` folder in init.lua (e.g., `require("core.plugin_config")`).
Doing so will immediately execute all plugin config files—including Telescope's config—
even before Lazy.nvim has loaded the plugin.

This caused a circular dependency issue where:

1. `init.lua` eagerly loads `core.plugin_config`, which includes `telescope.lua`
2. `telescope.lua` tries to call `require("telescope")` and configure it
3. At the same time, Lazy.nvim is also preparing to lazy-load `telescope.nvim`
4. This results in both sides trying to load `telescope.nvim` simultaneously,
   leading to a "loop or previous error loading module" message

✅ Solution:

- Do NOT require `core.plugin_config` in `init.lua`
- Instead, in `core.plugins.lua`, use Lazy's `config = function()` to load plugin config individually
  when the plugin is actually initialized.

Example:

```lua
{
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = function() return vim.fn.executable("make") == 1 end },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local ok, err = pcall(require, "core.plugin_config.telescope")
    if not ok then
      vim.notify("Failed to load telescope config: " .. err, vim.log.levels.ERROR)
    end
  end,
}
```
