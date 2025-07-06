# Plugin Overview & Usage

## 🚀 My Neovim Configuration

A modern and practical Neovim setup using packer.nvim as plugin manager. This configuration focuses on clean UI, efficient navigation, autocompletion, LSP, Git integration, and improved editing experience.

---

## 📦 Plugin Overview & Usage

UI & Appearance

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

### EasyMotion:

- `f{char}` — Jump to a specific character in the buffer or all windows
- `s{char}{char}` — Jump to a two-character sequence across windows
- `<Leader>l` — Jump to the beginning of a visible line
- `<Leader>w` — Jump to the beginning of a visible word
- `/ + {char}` — Search for a single character and jump (EasyMotion-style)
- `n` — Jump to the next EasyMotion match
- `N` — Jump to the previous EasyMotion match

---

## 🔍 Fuzzy Search

- telescope.nvim: Powerful fuzzy finder

---

## 🔧 LSP

- nvim-lspconfig: LSP configuration
- mason.nvim: LSP/DAP/formatter installer (:Mason to open UI)
- mason-lspconfig.nvim: Bridge between Mason and native LSP
- maxon-tool-installer.nvim: Install LSP servers, formatters, and debuggers

### nvim-lspconfig

Responsible for configuring and launching LSP servers.

- Maintained by the official Neovim team.
- Provides easy lspconfig.<server>.setup() APIs to configure each LSP server manually.

### mason.nvim

A package manager for LSP servers, formatters, and debuggers.

- Provides a GUI (:Mason) to install tools like lua-language-server, prettier, debugpy, etc.
- Installs tools but does not automatically configure them with lspconfig.

### mason-lspconfig.nvim

Bridges mason.nvim and nvim-lspconfig.

- Automatically connects installed LSP servers from Mason to lspconfig.
- Handles server name mapping and calls lspconfig[server].setup() for you.
- Supports both ensure_installed and automatic_installation.

### mason-tool-installer.nvim

Automatically installs a list of desired tools via Mason.

- Helps manage and install LSPs, formatters, linters, and DAPs in one place.
- You define a list via ensure_installed = { "lua_ls", "stylua", "prettier", ... }.
- Ensures all required tools are installed on startup.

### How they work together

1. You define which tools and LSPs to install in mason-tool-installer.
2. mason.nvim installs those tools behind the scenes.
3. mason-lspconfig.nvim connects the installed LSPs to nvim-lspconfig.
4. nvim-lspconfig applies your custom configuration to each LSP server.

---

## Autocompletion

---

## Snippets

- "L3MON4D3/LuaSnip": Snippet engine

VSCode snippets are just static data files (in JSON format).
They don’t contain logic—they’re simply templates that VSCode reads and loads into memory.

VScode snippet example:

```json
{
  "Print to console": {
    "prefix": "log",
    "body": ["console.log('$1');"],
    "description": "Log output to console"
  }
}
```

### Why use Lua in Neovim

Neovim doesn’t have built-in snippet support like VSCode.
You need a plugin to handle snippets. LuaSnip is one of the most powerful snippet engines for Neovim.

LuaSnip supports two approaches:

1. Static snippets: Lazy-load VSCode JSON snippets.

```lua
require("luasnip.loaders.from_vscode").lazy_load()
```

2. Dynamic snippets: Write your snippets in Lua to include logic, like:

```lua
s("time", {
  t(os.date("%Y-%m-%d")),
})
```

---

## mini

### mini.ai

mini.ai extends text objects in Neovim. It lets you easily select, delete, or copy code blocks like parentheses, quotes, HTML tags, and more.

Example:

- `vi(` → select inside parentheses
- `va"` → select around double quotes
- `da}` → delete a block inside curly braces
- `yi>` → yank (copy) content inside HTML tags

### mini.surround

mini.surround is a plugin to add, delete, or change surrounding characters, like parentheses, quotes, or HTML tags.

Example:

- `ysiw"` → add double quotes around the current word
- `cs"'` → change surrounding " to '
- `ds(` → delete surrounding parentheses

#### Why choose mini.surround over vim-surround?

- mini.surround is extremely lightweight. Only implements the core features—no extra overhead.
- It’s written in Lua, making it faster and more efficient.
- Doesn’t require legacy Vim compatibility layers or plugins.
- If you’re already using other mini.nvim modules (like mini.ai, mini.comment), it’s easier to keep things consistent.

### mini.statusline

mini.statusline is a lightweight statusline plugin for Neovim.

#### Compare to lualine.nvim

- mini.statusline is extremely lightweight and fast.
- no external dependencies.
- Basic customization (Lualin has more features).
- lualine can show more complex information like diagnostics, git status, file format, etc.
- recommended for users who want something simple

---

## Treesitter

Tree-sitter is a code parser engine that reads your code and builds a syntax tree, allowing Neovim to understand the structure of your code, not just the words.

### What is it used for

- Syntax highlighting – better and more precise coloring.
- Text object selection – easily select functions, classes, blocks, etc.
- Code folding – fold code based on syntax, not just indentation.
- Automatic indentation – smarter indentation rules.
- Movement between blocks – jump between functions, classes, and other code blocks.
- Incremental selection – gradually expand your selection to cover larger code structures.

Example

```vim
vaf   -- visual select a function (function block)
vac   -- visual select a class
```
