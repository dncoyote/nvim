# 📦 Plugin Configuration & Feature Overview (explanation.md)

This document explains each plugin configured in your Neovim setup, their purpose, implemented features, and optional enhancements.

---

## 🌲 Treesitter (`nvim-treesitter` + `nvim-ts-autotag`)
- **Syntax highlighting** for Lua, Java, TS, TSX, HTML, Markdown, etc.
- **Auto tag closing** in TSX and HTML via `nvim-ts-autotag`
- Auto updates with `:TSUpdate`

---

## 🔍 Telescope (`telescope.nvim` + `telescope-ui-select.nvim`)
- Fuzzy file search, grep, buffer listing, diagnostics
- Dropdown UI for `vim.ui.select` via `ui-select`
- Keybind navigation in prompt (`<C-j/k>`, `<C-n/p>`)

---

## 🗂 File Explorer (`nvim-tree`)
- Toggleable with `<leader>e`
- Shows dotfiles, Git integration enabled
- Opens on startup

---

## 🎛️ Statusline (`lualine.nvim`)
- Dracula theme, Git branch, diagnostics, filename, encoding, etc.
- Clean inactive sections

---

## 🔍 Which-key (`which-key.nvim`)
- Shows popup for keymap groups and subcommands
- Lazy-loaded on VimEnter

---

## 🧠 LSP Setup
- `mason`, `mason-lspconfig`, `mason-nvim-dap` install LSPs & DAPs
- `nvim-lspconfig` configures `lua_ls`, `tsserver`, `jdtls`
- LSP keymaps (hover, definition, references, rename, actions)
- Restart commands for LSP and JDTLS

---

## 🧪 Debugging (`nvim-dap`, `nvim-dap-ui`, `nvim-dap-virtual-text`)
- Full DAP UI with sidebar + REPL
- Inline variable values with virtual text
- Breakpoint icons + attach/launch configs for Java

---

## 🛠 Formatter & Linters (`none-ls.nvim`)
- `stylua` (Lua), `eslint_d` (JS), `prettier` (web formats)
- Unified formatter shortcut: `<leader>cf`

---

## 📜 Markdown (`markdown-preview.nvim`, `goyo.vim`, `gitsigns.nvim`)
- Markdown preview in browser (`<leader>mp`)
- Zen mode (`<leader>mz`)
- Git signs in Markdown buffers

---

## 🔁 Git (`gitsigns`, `vim-fugitive`, `lazygit.nvim`, `git-blame.nvim`)
- Gitsigns: show diffs inline, preview hunks (`<leader>gh`)
- Fugitive: stage/commit/push (`<leader>ga/gc/gp`)
- LazyGit: floating TUI (`<leader>lg`)
- Git blame line info (`<leader>gb`)

---

## 📌 Harpoon
- Quick file marking with `<S-m>` (toggle)
- Quick menu with `<Tab>`
- Optional navigation keys can be added (`<leader>1`–`<leader>4`)

---

## 💬 Comments (`Comment.nvim` + `ts-context-commentstring`)
- Toggle line: `<leader>/` (normal/visual)
- TSX-aware comment logic via Tree-sitter

---

## 🧠 Completion (`nvim-cmp` + `LuaSnip` + `friendly-snippets`)
- Tab completion, LSP integration, snippet expansion
- Sources: LSP, buffer, path, LuaSnip

---

## 🔥 Indentation (`indent-blankline.nvim`)
- Visual indent guides (`│`)
- Scope highlighting
- Disabled in terminals/help/dashboard

---

## ☕ Spring Boot (`springboot-nvim`)
- Spring Boot run in terminal (`<leader>Jr`)
- Class/interface/enum generation (`<leader>Jc/Ji/Je`)
