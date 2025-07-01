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