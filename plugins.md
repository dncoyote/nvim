# Neovim Plugins Overview

## UI / Navigation

### nvim-tree.lua
- **Purpose:** File explorer sidebar with icon support.
- **Keymaps:**  
  - `<leader>ee`: Toggle file explorer  
  - `<leader>er`: Focus file explorer  
  - `<leader>ef`: Find current file in explorer

### bufferline.nvim
- **Purpose:** Buffer/tab line with icons and diagnostics.
- **Keymaps:**  
  - `<leader>bp`: Previous buffer  
  - `<leader>bn`: Next buffer

### telescope.nvim
- **Purpose:** Fuzzy finder for files, grep, buffers, etc.
- **Keymaps:**  
  - `<leader>ff`: Find files  
  - `<leader>fg`: Live grep  
  - `<leader>fb`: Buffers  
  - `<leader>fh`: Help tags  
  - `<leader>fs`: Current buffer fuzzy find  
  - `<leader>fo`: Document symbols  
  - `<leader>fi`: Incoming calls  
  - `<leader>fm`: Methods in current class  
  - `<leader>ft`: Grep in current NvimTree node

---

## LSP, Language, and Completion

### nvim-lspconfig
- **Purpose:** Manage LSP servers.
- **Keymaps:**  
  - `<leader>gg`: Hover  
  - `<leader>gd`: Go to definition  
  - `<leader>gr`: References  
  - `<leader>gs`: Signature help  
  - `<leader>rr`: Rename  
  - `<leader>gf`: Format (async)  
  - `<leader>ga`: Code actions  
  - `<leader>gl`: Show diagnostics float  
  - `<leader>gp`: Previous diagnostic  
  - `<leader>gn`: Next diagnostic

### nvim-jdtls
- **Purpose:** Java LSP integration (requires Java files).
- **Keymaps:**  
  - `<leader>go`: Organize imports  
  - `<leader>gu`: Update project config  
  - `<leader>tc`: Test class  
  - `<leader>tm`: Test nearest method

### none-ls.nvim
- **Purpose:** Formatter and linter integration.
- **Keymaps:**  
  - `<leader>cf`: Format current buffer

### nvim-cmp
- **Purpose:** Autocompletion engine with snippet support.
- **Keymaps:**  
  - `<C-j>` / `<C-k>`: Next/prev completion item  
  - `<C-b>` / `<C-f>`: Scroll docs up/down  
  - `<C-Space>`: Trigger completion  
  - `<CR>`: Confirm completion  
  - `<Tab>` / `<S-Tab>`: Cycle snippets or completions

---

## Debugging

### nvim-dap & nvim-dap-ui
- **Purpose:** Debug adapter protocol and UI.
- **Keymaps:**  
  - `<leader>bb`: Toggle breakpoint  
  - `<leader>bc`: Set conditional breakpoint  
  - `<leader>bl`: Set logpoint  
  - `<leader>br`: Clear breakpoints  
  - `<leader>dc`: Continue  
  - `<leader>dj`: Step over  
  - `<leader>dk`: Step into  
  - `<leader>do`: Step out  
  - `<leader>dr`: Toggle REPL  
  - `<leader>dl`: Run last  
  - `<leader>dd`: Disconnect and close UI

### nvim-dap-virtual-text
- **Purpose:** Inline debug variable values.
- **No specific keymaps; enabled by default**

---

## Utilities

### harpoon
- **Purpose:** Mark and quickly jump to frequently used files.
- **Keymaps:**  
  - `<S-m>`: Add current file to harpoon marks  
  - `<TAB>`: Toggle harpoon menu  
  - `<leader>h1` - `<leader>h9`: Jump to marked files 1-9

### vim-maximizer
- **Purpose:** Maximize/restore current window.
- **Keymaps:**  
  - `<leader>sm`: Toggle maximize

### vim-commentary
- **Purpose:** Comment/uncomment lines.
- **Keymaps:**  
  - Use `gc` motions (no explicit keymaps)

### vim-rest-console
- **Purpose:** REST API client in Neovim.
- **Keymaps:**  
  - `<leader>xr`: Run REST query

### vim-tmux-navigator
- **Purpose:** Navigate between Neovim splits and tmux panes.
- **Loads only if inside tmux, no keymaps needed.

---

## Themes and Appearance

### kanagawa.nvim
- **Purpose:** Colorscheme with custom palette and diff colors.
- **No keymaps**

### lualine.nvim
- **Purpose:** Statusline with filename, LSP status, icons.
- **No keymaps**

### indent-blankline.nvim
- **Purpose:** Indentation guides.
- **No keymaps**

---

